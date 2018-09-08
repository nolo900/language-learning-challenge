class Language < ApplicationRecord
  has_many :messages
  has_many :proficiencies

  validates :name, presence: true
  validates :name, uniqueness: true

  before_destroy :ensure_not_referenced_by_messages_or_proficiencies

  def ensure_not_referenced_by_messages_or_proficiencies
    if has_messages? || has_proficiencies?
      errors[:base] << 'Cannot Delete, this language has messages or proficiencies.'
      throw :abort
    end
  end

  def has_messages?
    messages.count > 0
  end

  def has_proficiencies?
    proficiencies.count > 0
  end
end
