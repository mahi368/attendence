require 'test_helper'

class StandardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get standards_index_url
    assert_response :success
  end

  test "should get show" do
    get standards_show_url
    assert_response :success
  end

  test "should get new" do
    get standards_new_url
    assert_response :success
  end

  test "should get edit" do
    get standards_edit_url
    assert_response :success
  end

end
