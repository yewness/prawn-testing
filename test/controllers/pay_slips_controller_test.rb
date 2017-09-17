require 'test_helper'

class PaySlipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_slip = pay_slips(:one)
  end

  test "should get index" do
    get pay_slips_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_slip_url
    assert_response :success
  end

  test "should create pay_slip" do
    assert_difference('PaySlip.count') do
      post pay_slips_url, params: { pay_slip: { income: @pay_slip.income, name: @pay_slip.name, slip_no: @pay_slip.slip_no } }
    end

    assert_redirected_to pay_slip_url(PaySlip.last)
  end

  test "should show pay_slip" do
    get pay_slip_url(@pay_slip)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_slip_url(@pay_slip)
    assert_response :success
  end

  test "should update pay_slip" do
    patch pay_slip_url(@pay_slip), params: { pay_slip: { income: @pay_slip.income, name: @pay_slip.name, slip_no: @pay_slip.slip_no } }
    assert_redirected_to pay_slip_url(@pay_slip)
  end

  test "should destroy pay_slip" do
    assert_difference('PaySlip.count', -1) do
      delete pay_slip_url(@pay_slip)
    end

    assert_redirected_to pay_slips_url
  end
end
