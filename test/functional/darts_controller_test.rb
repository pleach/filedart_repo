require 'test_helper'

class DartsControllerTest < ActionController::TestCase
  setup do
    @dart = darts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:darts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dart" do
    assert_difference('Dart.count') do
      post :create, dart: { name: @dart.name, percentage: @dart.percentage, size: @dart.size }
    end

    assert_redirected_to dart_path(assigns(:dart))
  end

  test "should show dart" do
    get :show, id: @dart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dart
    assert_response :success
  end

  test "should update dart" do
    put :update, id: @dart, dart: { name: @dart.name, percentage: @dart.percentage, size: @dart.size }
    assert_redirected_to dart_path(assigns(:dart))
  end

  test "should destroy dart" do
    assert_difference('Dart.count', -1) do
      delete :destroy, id: @dart
    end

    assert_redirected_to darts_path
  end
end
