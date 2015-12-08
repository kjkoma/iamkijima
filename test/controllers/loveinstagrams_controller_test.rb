require 'test_helper'

class LoveinstagramsControllerTest < ActionController::TestCase
  setup do
    @loveinstagram = loveinstagrams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loveinstagrams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loveinstagram" do
    assert_difference('Loveinstagram.count') do
      post :create, loveinstagram: { loveword: @loveinstagram.loveword }
    end

    assert_redirected_to loveinstagram_path(assigns(:loveinstagram))
  end

  test "should show loveinstagram" do
    get :show, id: @loveinstagram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loveinstagram
    assert_response :success
  end

  test "should update loveinstagram" do
    patch :update, id: @loveinstagram, loveinstagram: { loveword: @loveinstagram.loveword }
    assert_redirected_to loveinstagram_path(assigns(:loveinstagram))
  end

  test "should destroy loveinstagram" do
    assert_difference('Loveinstagram.count', -1) do
      delete :destroy, id: @loveinstagram
    end

    assert_redirected_to loveinstagrams_path
  end
end
