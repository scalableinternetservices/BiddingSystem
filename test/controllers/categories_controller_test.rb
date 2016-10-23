require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    if @current_user
      assert_response :success
    end
  end

  test "should get new" do
    get new_category_url
    if @current_user
      assert_response :success
    end
  end

  test "should create category" do
    if @current_user
      assert_difference('Category.count') do
        post categories_url, params: { category: { description: @category.description, name: @category.name } }
      end
      assert_redirected_to category_url(Category.last)
    end
  end

  test "should show category" do
    get category_url(@category)
    if @current_user
      assert_response :success
    end
  end

  test "should get edit" do
    get edit_category_url(@category)
    if @current_user
      assert_response :success
    end
  end

  test "should update category" do
    patch category_url(@category), params: { category: { description: @category.description, name: @category.name } }
    if @current_user
      assert_redirected_to category_url(@category)
    end
  end

  test "should destroy category" do
    if @current_user
      assert_difference('Category.count', -1) do
        delete category_url(@category)
      end
      assert_redirected_to categories_url
    end
  end
end
