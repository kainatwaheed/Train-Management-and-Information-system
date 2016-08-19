require 'test_helper'

class TrainroutesControllerTest < ActionController::TestCase
  setup do
    @trainroute = trainroutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainroutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trainroute" do
    assert_difference('Trainroute.count') do
      post :create, trainroute: { arrivaldate: @trainroute.arrivaldate, arrivaltime: @trainroute.arrivaltime, deptdate: @trainroute.deptdate, deptime: @trainroute.deptime, destination: @trainroute.destination, source: @trainroute.source, train_id: @trainroute.train_id }
    end

    assert_redirected_to trainroute_path(assigns(:trainroute))
  end

  test "should show trainroute" do
    get :show, id: @trainroute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trainroute
    assert_response :success
  end

  test "should update trainroute" do
    patch :update, id: @trainroute, trainroute: { arrivaldate: @trainroute.arrivaldate, arrivaltime: @trainroute.arrivaltime, deptdate: @trainroute.deptdate, deptime: @trainroute.deptime, destination: @trainroute.destination, source: @trainroute.source, train_id: @trainroute.train_id }
    assert_redirected_to trainroute_path(assigns(:trainroute))
  end

  test "should destroy trainroute" do
    assert_difference('Trainroute.count', -1) do
      delete :destroy, id: @trainroute
    end

    assert_redirected_to trainroutes_path
  end
end
