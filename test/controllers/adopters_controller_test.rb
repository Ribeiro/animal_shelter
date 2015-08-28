require 'test_helper'

class AdoptersControllerTest < ActionController::TestCase
  setup do
    @adopter = adopters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adopters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adopter" do
    assert_difference('Adopter.count') do
      post :create, adopter: { address: @adopter.address, cpf: @adopter.cpf, name: @adopter.name, phone: @adopter.phone, rg: @adopter.rg }
    end

    assert_redirected_to adopter_path(assigns(:adopter))
  end

  test "should show adopter" do
    get :show, id: @adopter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adopter
    assert_response :success
  end

  test "should update adopter" do
    patch :update, id: @adopter, adopter: { address: @adopter.address, cpf: @adopter.cpf, name: @adopter.name, phone: @adopter.phone, rg: @adopter.rg }
    assert_redirected_to adopter_path(assigns(:adopter))
  end

  test "should destroy adopter" do
    assert_difference('Adopter.count', -1) do
      delete :destroy, id: @adopter
    end

    assert_redirected_to adopters_path
  end
end
