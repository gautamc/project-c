require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user's abilities" do
    user = User.new(
      email: "sally.anon@yopmail.com",
      password: "letmein123",
      password_confirmation: "letmein123"
    )
    user.role = 'Guest'
    assert user.valid?
    user.save!

    assert_not user.isAdmin?
    assert_not user.isApprovedUser?
    assert user.isGuest?

    puts user.can?(:list, :users)

  end

end
