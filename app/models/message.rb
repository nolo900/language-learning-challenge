class Message < ApplicationRecord
  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
  belongs_to :language

  validate :language_exists
  validate :users_speak_same_language
  validate :sender_and_recipient_proficiency

  # Messages are only valid if both the recipient & receiver have proficiencies
  # in the message's language with values within 2 of each other.

  def language_exists
    if language.nil?
      errors.add(:base,"Language Doesn't Exist")
      throw :abort
    end
  end

  def users_speak_same_language
    if !sender.proficiencies || !recipient.proficiencies
      errors.add(:base, "One or more of these users does not have any understanding of the language.")
      throw :abort
    end

    sender_languages = []
    sender.proficiencies.each do |prof|
      sender_languages << prof.language.name
    end

    recipient_languages = []
    recipient.proficiencies.each do |prof|
      recipient_languages << prof.language.name
    end

    if !sender_languages.include?(language.name) || !recipient_languages.include?(language.name)
      errors.add(:message, "not understood by both users.")
      throw :abort
    end
  end

  def sender_and_recipient_proficiency
    sender_proficiency = sender.proficiencies.where(language:language).first.proficiency_level
    recipient_proficiency = recipient.proficiencies.where(language:language).first.proficiency_level
    sender_acceptable_range = (sender_proficiency - 2)..(sender_proficiency + 2)
    # recipient_acceptable_range = (recipient_proficiency - 2)..(recipient_proficiency + 2)

    if !sender_acceptable_range.include?(recipient_proficiency)
      errors.add(:message, "outside proficiency range.")
      throw :abort
    end
  end


end
