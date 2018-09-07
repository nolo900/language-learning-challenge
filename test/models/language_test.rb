require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  setup do
    @language = languages(:one)
  end

  test "language cannot be deleted if referenced by message" do
    @message = messages(:one)
    initial_count = 0
    initial_count == Language.count

    @language.destroy

    assert(Language.count,initial_count)
  end

  test "language can be deleted if not referenced by message" do
    @message = messages(:two)
    @message.destroy
    initial_count = 0
    initial_count == Language.count

    @language.destroy

    assert(Language.count,initial_count - 1)
  end

  test "language cannot be deleted if referenced by proficiency" do
    @proficiency = proficiencies(:one)
    initial_count = 0
    initial_count == Proficiency.count

    @language.destroy

    assert(Proficiency.count,initial_count)
  end

  test "language can be deleted if not referenced by proficiency" do
    @proficiency = proficiencies(:two)
    @proficiency.destroy
    initial_count = 0
    initial_count == Proficiency.count

    @language.destroy

    assert(Proficiency.count,initial_count - 1)
  end
end
