require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "is valid if sender & receiver language proficiency with within 2 values of each other" do
    @message = messages(:one)
    assert(@message.valid?)
  end

  test "is not valid if sender & receiver language proficiency is outside 2 values of each other" do
    @message = messages(:two)
    assert_not(@message.valid?)
  end
end
