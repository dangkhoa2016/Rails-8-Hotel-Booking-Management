require "test_helper"

class VipCustomerBenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vip_customer_benefit = vip_customer_benefits(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get vip_customer_benefits_url
    assert_response :success
  end

  test "should get new" do
    get new_vip_customer_benefit_url
    assert_response :success
  end

  test "should create vip_customer_benefit" do
    assert_difference("VipCustomerBenefit.count") do
      post vip_customer_benefits_url, params: { vip_customer_benefit: { customer_id: @vip_customer_benefit.customer_id, discount_amount_on_additional_services: @vip_customer_benefit.discount_amount_on_additional_services, discount_amount_on_room_price: @vip_customer_benefit.discount_amount_on_room_price, discount_percent_on_additional_services: @vip_customer_benefit.discount_percent_on_additional_services, discount_percent_on_room_price: @vip_customer_benefit.discount_percent_on_room_price, discount_type: @vip_customer_benefit.discount_type, status: @vip_customer_benefit.status } }
    end

    assert_redirected_to vip_customer_benefit_url(VipCustomerBenefit.last)
  end

  test "should show vip_customer_benefit" do
    get vip_customer_benefit_url(@vip_customer_benefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_vip_customer_benefit_url(@vip_customer_benefit)
    assert_response :success
  end

  test "should update vip_customer_benefit" do
    patch vip_customer_benefit_url(@vip_customer_benefit), params: { vip_customer_benefit: { customer_id: @vip_customer_benefit.customer_id, discount_amount_on_additional_services: @vip_customer_benefit.discount_amount_on_additional_services, discount_amount_on_room_price: @vip_customer_benefit.discount_amount_on_room_price, discount_percent_on_additional_services: @vip_customer_benefit.discount_percent_on_additional_services, discount_percent_on_room_price: @vip_customer_benefit.discount_percent_on_room_price, discount_type: @vip_customer_benefit.discount_type, status: @vip_customer_benefit.status } }
    assert_redirected_to vip_customer_benefit_url(@vip_customer_benefit)
  end

  test "should destroy vip_customer_benefit" do
    assert_difference("VipCustomerBenefit.count", -1) do
      delete vip_customer_benefit_url(@vip_customer_benefit)
    end

    assert_redirected_to vip_customer_benefits_url
  end
end
