require 'test_helper'

class ProficiencyTest < ActiveSupport::TestCase
  test "that proficiency is only valid with proficiency_level integer between 1 and 10" do
    @proficiency = proficiencies(:one)

    @proficiency.proficiency_level = 1000
    assert_not(@proficiency.valid?)

    @proficiency.proficiency_level = 3.4
    assert_not(@proficiency.valid?)

    @proficiency.proficiency_level = 3
    assert(@proficiency.valid?)
  end

  test "that language avg proficiency gets calculated after each proficiency save" do
    @language = languages(:four)

    @proficiency3 = proficiencies(:three)
    @proficiency4 = proficiencies(:four)

    @proficiency3.proficiency_level = 3
    @proficiency3.save!

    @proficiency4.proficiency_level = 9
    @proficiency4.save!

    @language.reload

    assert_equal(6,@language.avg_proficiency)
  end

  test "that only one proficiency can exist for each language" do
    @user = users(:one)
    @existing_lang = @user.proficiencies.first.language
    @proficiency = Proficiency.new(user:@user,language:@existing_lang)

    assert_not(@proficiency.valid?)
  end
end
