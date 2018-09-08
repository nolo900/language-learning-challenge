class User < ApplicationRecord
  has_many :proficiencies, dependent: :destroy
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id', dependent: :destroy
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
