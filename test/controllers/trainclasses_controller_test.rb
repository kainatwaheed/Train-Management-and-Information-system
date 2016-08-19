require 'test_helper'

class TrainclassesControllerTest < ActionController::TestCase
  setup do
    @trainclass = trainclasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainclasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trainclass" do
    assert_difference('Trainclass.count') do
      post :create, trainclass: { fare: @trainclass.fare, name: @trainclass.name, totalseats: @trainclass.totalseats, train_id: @trainclass.train_id }
    end

    assert_redirected_to trainclass_path(assigns(:trainclass))
  end

  test "should show trainclass" do
    get :show, id: @trainclass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trainclass
    assert_response :success
  end

  test "should update trainclass" do
    patch :update, id: @trainclass, trainclass: { fare: @trainclass.fare, name: @trainclass.name, totalseats: @trainclass.totalseats, train_id: @trainclass.train_id }
    assert_redirected_to trainclass_path(assigns(:trainclass))
  end

  test "should destroy trainclass" do
    assert_difference('Trainclass.count', -1) do
      delete :destroy, id: @trainclass
    end

    assert_redirected_to trainclasses_path
  end
end
