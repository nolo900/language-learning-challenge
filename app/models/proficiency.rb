class Proficiency < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates  :proficiency_level,
             presence: true,
             numericality: {
                 only_integer: true,
                 :greater_than_or_equal_to => 1,
                 :less_than_or_equal_to => 10,
                 :message => "is invalid" },
             on: [:create, :update]

  validates :language, uniqueness: { scope: :user,
                                     message: "can only have one proficiency per user." }

  after_save :update_language_avg_proficiency

  def update_language_avg_proficiency
      arr = []
      language.proficiencies.each do |prof|
        arr << prof.proficiency_level
      end
      new_avg = arr.inject{ |sum, el| sum + el }.to_f / arr.size
      language.avg_proficiency = new_avg
      language.save
  end

end
