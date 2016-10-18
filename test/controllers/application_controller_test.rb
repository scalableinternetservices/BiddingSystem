require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  
  test "should get homepage" do
    get root_path
    assert_response :success
    assert_select "title", "Online Bidding System"
  end

end
