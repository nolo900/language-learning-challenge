require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  setup do
    @language = languages(:one)
  end

  test "language cannot be deleted if referenced by message or proficiency" do
    @message = messages(:one)
    @proficiency = proficiencies(:one)
    initial_count = Language.count

    @language.destroy

    assert_equal(Language.count,initial_count)
  end

  test "language can be deleted if not referenced by message or proficiency" do
    @message = messages(:one)
    @message.destroy
    @proficiency = proficiencies(:one)
    @proficiency.destroy
    initial_count = Language.count

    @language.destroy

    assert_equal(Language.count,initial_count - 1)
  end

end
