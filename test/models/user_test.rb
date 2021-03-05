require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "admin@grinnell.edu", username: "admin", password: "admin_password", admin:false)
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@grinnell.edu USER123@gmail.com userUs12eR@uiowa.edu first.last@example.net]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.nil?, "user should exist"
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[something!!!@gmail.com @grinnell.edu ........ somebody@gmailcom]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "users should not be admins" do
    assert_not @user.admin?, "regular users should not be admins"
  end

end