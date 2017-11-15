require './test/test_helper'
require 'pry'
class HomepageTest < CapybaraTestCase
  def test_user_can_see_the_homepage
    visit '/'

    # save_and_open_page
    assert page.has_content?("Welcome!")
    assert_equal 200, page.status_code
  end

  def test_user_gets_error_for_nonexistant_page
    visit '/gxxysda'
    # binding.pry
    assert page.has_content?("Page not found.")
    assert 404, page.status_code
  end
end
