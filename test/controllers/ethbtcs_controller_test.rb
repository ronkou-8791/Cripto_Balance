require 'test_helper'

class EthbtcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ethbtc = ethbtcs(:one)
  end

  test "should get index" do
    get ethbtcs_url
    assert_response :success
  end

  test "should get new" do
    get new_ethbtc_url
    assert_response :success
  end

  test "should create ethbtc" do
    assert_difference('Ethbtc.count') do
      post ethbtcs_url, params: { ethbtc: { buy: @ethbtc.buy, buy_size: @ethbtc.buy_size, price: @ethbtc.price, sell: @ethbtc.sell, sell_size: @ethbtc.sell_size } }
    end

    assert_redirected_to ethbtc_url(Ethbtc.last)
  end

  test "should show ethbtc" do
    get ethbtc_url(@ethbtc)
    assert_response :success
  end

  test "should get edit" do
    get edit_ethbtc_url(@ethbtc)
    assert_response :success
  end

  test "should update ethbtc" do
    patch ethbtc_url(@ethbtc), params: { ethbtc: { buy: @ethbtc.buy, buy_size: @ethbtc.buy_size, price: @ethbtc.price, sell: @ethbtc.sell, sell_size: @ethbtc.sell_size } }
    assert_redirected_to ethbtc_url(@ethbtc)
  end

  test "should destroy ethbtc" do
    assert_difference('Ethbtc.count', -1) do
      delete ethbtc_url(@ethbtc)
    end

    assert_redirected_to ethbtcs_url
  end
end
