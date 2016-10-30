require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    
  end
  
  test "should search products under bid" do
    get search_products_url, params: { name: "Canon EOS Rebel T5i", category: 0, location_id: 8, highest_bid: 9, format: "json" }
    assert_response :success
  end
end
