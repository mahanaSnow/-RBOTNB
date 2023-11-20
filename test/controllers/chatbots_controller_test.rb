require "test_helper"

class ChatbotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatbots_index_url
    assert_response :success
  end

  test "should get new" do
    get chatbots_new_url
    assert_response :success
  end

  test "should get show" do
    get chatbots_show_url
    assert_response :success
  end

  test "should get create" do
    get chatbots_create_url
    assert_response :success
  end

  test "should get edit" do
    get chatbots_edit_url
    assert_response :success
  end

  test "should get update" do
    get chatbots_update_url
    assert_response :success
  end

  test "should get destroy" do
    get chatbots_destroy_url
    assert_response :success
  end

  test "should get search" do
    get chatbots_search_url
    assert_response :success
  end
end
