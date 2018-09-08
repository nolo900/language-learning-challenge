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
    @language = languages(:two)

    @proficiency2 = proficiencies(:two) #proficiency_level: 1
    @proficiency3 = proficiencies(:three) #proficiency_level: 1
    @proficiency2.proficiency_level = 3
    @proficiency2.save!

    @proficiency3.proficiency_level = 9
    @proficiency3.save!

    @language.reload

    assert_equal(6,@language.avg_proficiency)
  end
end
