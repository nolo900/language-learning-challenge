require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    @user = users(:one)

    assert(@user.valid?)
  end
end
