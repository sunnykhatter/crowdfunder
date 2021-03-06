require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest

  test "successful registration" do 
    visit "/users/new"
    assert_equal new_user_path, current_path

    # Assert there is a link in the nav to Sign Up
    assert find('.navbar').has_link?('Sign Up')

    user = FactoryGirl.build(:user) 

    # Fill in the from with the info from user created by FactoryGirl
    fill_in "user[email]", :with => user.email
    fill_in "user[first_name]", :with => user.first_name
    fill_in "user[last_name]", :with => user.last_name
    fill_in "user[password]", :with => user.password
    click_button "Create Account"

    # After submitting the form, should be redirected to root
    assert_equal root_path, current_path
    # While a message says "Account Created"
    assert page.has_content?("Account created")
    # And the nav no longer has a link to Sign Up but Logout
    assert find('.navbar').has_no_link?('Sign Up')
    assert find('.navbar').has_link?('Logout')
  end

  test "failed registration" do 
    visit "/users/new"
    user = FactoryGirl.build(:user) 

    # Invalid form submission ...
    fill_in "user[email]", :with => user.email
    click_button "Create Account"
    # Should redirect to users_path and ...
    assert_equal users_path, current_path
    # ... no message saying "Account created" should appear
    assert page.has_no_content?("Account created")
    # Should see "Try again" message on failure to register 
    assert find('.alert').has_content?("Try again")
  end

   test "successful log in" do
    visit '/'
    assert find('.navbar').has_no_link?('Logout')
    # Calling the helper method here, and it returns a user
    user = setup_signed_in_user
    assert find('.navbar').has_link?('Logout')
  end

  test "unsuccessful log in" do
    visit '/sessions/new'

    fill_in "email", with: "a@b.com"
    fill_in "password", with: "invalid creds"
    click_button "Log in"

    assert_equal sessions_path, current_path

    assert page.has_content?('Invalid')
  end

  test "successful logout" do
    # javascript_driver can handle JS which we need for logout button, 
    # since the button uses `method: delete` Rails UJS helper    
    Capybara.current_driver = Capybara.javascript_driver

    # Calling the helper method again
    user = setup_signed_in_user

    visit '/'

    find('.navbar').click_link 'Logout'

    assert page.has_content?("Bye")
    assert find('.navbar').has_no_link?('Logout')
   end

end