require 'test_helper'

class TrainfaresControllerTest < ActionController::TestCase
  setup do
    @trainfare = trainfares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainfares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trainfare" do
    assert_difference('Trainfare.count') do
      post :create, trainfare: { destination: @trainfare.destination, fare1: @trainfare.fare1, fare2: @trainfare.fare2, fare3: @trainfare.fare3, source: @trainfare.source, train_id: @trainfare.train_id }
    end

    assert_redirected_to trainfare_path(assigns(:trainfare))
  end

  test "should show trainfare" do
    get :show, id: @trainfare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trainfare
    assert_response :success
  end

  test "should update trainfare" do
    patch :update, id: @trainfare, trainfare: { destination: @trainfare.destination, fare1: @trainfare.fare1, fare2: @trainfare.fare2, fare3: @trainfare.fare3, source: @trainfare.source, train_id: @trainfare.train_id }
    assert_redirected_to trainfare_path(assigns(:trainfare))
  end

  test "should destroy trainfare" do
    assert_difference('Trainfare.count', -1) do
      delete :destroy, id: @trainfare
    end

    assert_redirected_to trainfares_path
  end
end
