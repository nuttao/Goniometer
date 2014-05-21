require 'test_helper'

class BodyPartsControllerTest < ActionController::TestCase
  setup do
    @body_part = body_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:body_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create body_part" do
    assert_difference('BodyPart.count') do
      post :create, body_part: { name: @body_part.name }
    end

    assert_redirected_to body_part_path(assigns(:body_part))
  end

  test "should show body_part" do
    get :show, id: @body_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @body_part
    assert_response :success
  end

  test "should update body_part" do
    patch :update, id: @body_part, body_part: { name: @body_part.name }
    assert_redirected_to body_part_path(assigns(:body_part))
  end

  test "should destroy body_part" do
    assert_difference('BodyPart.count', -1) do
      delete :destroy, id: @body_part
    end

    assert_redirected_to body_parts_path
  end
end
