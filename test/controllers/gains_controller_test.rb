require 'test_helper'

class GainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gain = gains(:one)
  end

  test "should get index" do
    get gains_url
    assert_response :success
  end

  test "should get new" do
    get new_gain_url
    assert_response :success
  end

  test "should create gain" do
    assert_difference('Gain.count') do
      post gains_url, params: { gain: { currrent_price: @gain.currrent_price, gain_price: @gain.gain_price, purchase_price: @gain.purchase_price } }
    end

    assert_redirected_to gain_url(Gain.last)
  end

  test "should show gain" do
    get gain_url(@gain)
    assert_response :success
  end

  test "should get edit" do
    get edit_gain_url(@gain)
    assert_response :success
  end

  test "should update gain" do
    patch gain_url(@gain), params: { gain: { currrent_price: @gain.currrent_price, gain_price: @gain.gain_price, purchase_price: @gain.purchase_price } }
    assert_redirected_to gain_url(@gain)
  end

  test "should destroy gain" do
    assert_difference('Gain.count', -1) do
      delete gain_url(@gain)
    end

    assert_redirected_to gains_url
  end
end
