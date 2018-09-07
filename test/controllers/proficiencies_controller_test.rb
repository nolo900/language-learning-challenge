require 'test_helper'

class ProficienciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proficiency = proficiencies(:one)
  end

  test "should get index" do
    get proficiencies_url, as: :json
    assert_response :success
  end

  test "should create proficiency" do
    assert_difference('Proficiency.count') do
      post proficiencies_url, params: { proficiency: { language_id: @proficiency.language_id, proficiency_level: @proficiency.proficiency_level, user_id: @proficiency.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show proficiency" do
    get proficiency_url(@proficiency), as: :json
    assert_response :success
  end

  test "should update proficiency" do
    patch proficiency_url(@proficiency), params: { proficiency: { language_id: @proficiency.language_id, proficiency_level: @proficiency.proficiency_level, user_id: @proficiency.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy proficiency" do
    assert_difference('Proficiency.count', -1) do
      delete proficiency_url(@proficiency), as: :json
    end

    assert_response 204
  end
end
