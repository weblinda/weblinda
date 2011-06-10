require 'test_helper'

class MorphemesControllerTest < ActionController::TestCase
  setup do
    @morpheme = morphemes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:morphemes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create morpheme" do
    assert_difference('Morpheme.count') do
      post :create, :morpheme => @morpheme.attributes
    end

    assert_redirected_to morpheme_path(assigns(:morpheme))
  end

  test "should show morpheme" do
    get :show, :id => @morpheme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @morpheme.to_param
    assert_response :success
  end

  test "should update morpheme" do
    put :update, :id => @morpheme.to_param, :morpheme => @morpheme.attributes
    assert_redirected_to morpheme_path(assigns(:morpheme))
  end

  test "should destroy morpheme" do
    assert_difference('Morpheme.count', -1) do
      delete :destroy, :id => @morpheme.to_param
    end

    assert_redirected_to morphemes_path
  end
end
