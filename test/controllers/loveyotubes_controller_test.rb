require 'test_helper'

class LoveyotubesControllerTest < ActionController::TestCase
  setup do
    @loveyotube = loveyotubes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loveyotubes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loveyotube" do
    assert_difference('Loveyotube.count') do
      post :create, loveyotube: { loveword: @loveyotube.loveword }
    end

    assert_redirected_to loveyotube_path(assigns(:loveyotube))
  end

  test "should show loveyotube" do
    get :show, id: @loveyotube
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loveyotube
    assert_response :success
  end

  test "should update loveyotube" do
    patch :update, id: @loveyotube, loveyotube: { loveword: @loveyotube.loveword }
    assert_redirected_to loveyotube_path(assigns(:loveyotube))
  end

  test "should destroy loveyotube" do
    assert_difference('Loveyotube.count', -1) do
      delete :destroy, id: @loveyotube
    end

    assert_redirected_to loveyotubes_path
  end
end
