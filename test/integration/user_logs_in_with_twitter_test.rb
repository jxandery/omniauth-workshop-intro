require "test_helper"

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = OauthWorkshop::Application
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code

    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("Jack")
    assert page.has_link?("logout")
  end
end
