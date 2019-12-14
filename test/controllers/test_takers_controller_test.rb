require 'test_helper'

class TestTakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_taker = test_takers(:one)
  end

  test "should get index" do
    get test_takers_url
    assert_response :success
  end

  test "should get new" do
    get new_test_taker_url
    assert_response :success
  end

  test "should create test_taker" do
    assert_difference('TestTaker.count') do
      post test_takers_url, params: { test_taker: { address: @test_taker.address, email: @test_taker.email, firstname: @test_taker.firstname, gender: @test_taker.gender, lastname: @test_taker.lastname, login: @test_taker.login, password: @test_taker.password, picture: @test_taker.picture, title: @test_taker.title } }
    end

    assert_redirected_to test_taker_url(TestTaker.last)
  end

  test "should show test_taker" do
    get test_taker_url(@test_taker)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_taker_url(@test_taker)
    assert_response :success
  end

  test "should update test_taker" do
    patch test_taker_url(@test_taker), params: { test_taker: { address: @test_taker.address, email: @test_taker.email, firstname: @test_taker.firstname, gender: @test_taker.gender, lastname: @test_taker.lastname, login: @test_taker.login, password: @test_taker.password, picture: @test_taker.picture, title: @test_taker.title } }
    assert_redirected_to test_taker_url(@test_taker)
  end

  test "should destroy test_taker" do
    assert_difference('TestTaker.count', -1) do
      delete test_taker_url(@test_taker)
    end

    assert_redirected_to test_takers_url
  end
end
