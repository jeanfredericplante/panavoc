require 'test_helper'

class VocentriesControllerTest < ActionController::TestCase
  setup do
    @vocentry = vocentries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vocentry" do
    assert_difference('Vocentry.count') do
      post :create, :vocentry => @vocentry.attributes
    end

    assert_redirected_to vocentry_path(assigns(:vocentry))
  end

  test "should show vocentry" do
    get :show, :id => @vocentry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vocentry.to_param
    assert_response :success
  end

  test "should update vocentry" do
    put :update, :id => @vocentry.to_param, :vocentry => @vocentry.attributes
    assert_redirected_to vocentry_path(assigns(:vocentry))
  end

  test "should destroy vocentry" do
    assert_difference('Vocentry.count', -1) do
      delete :destroy, :id => @vocentry.to_param
    end

    assert_redirected_to vocentries_path
  end
end
