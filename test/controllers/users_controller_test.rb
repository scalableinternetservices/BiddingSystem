require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @products_under_bid = products_under_bids(:one)
    #puts @products_under_bid.product_id.class
  end
end
