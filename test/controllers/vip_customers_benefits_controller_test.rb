require "test_helper"

class VipCustomersBenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vip_customers_benefit = vip_customers_benefits(:one)
    @customers = customers(:two)
    @customers.update_column(:customer_type, :vip)
    sign_in users(:one)
  end

  test "should get index" do
    get vip_customers_benefits_url
    assert_response :success
  end

  test "should get new" do
    get new_vip_customers_benefit_url
    assert_response :success
  end

  test "should create vip_customers_benefit" do
    assert_difference("VipCustomersBenefit.count") do
      post vip_customers_benefits_url, params: {
        vip_customers_benefit: {
          customer_id:  @customers.id,
          discount_amount_on_additional_services: @vip_customers_benefit.discount_amount_on_additional_services,
          discount_amount_on_room_price: @vip_customers_benefit.discount_amount_on_room_price,
          discount_percent_on_additional_services: @vip_customers_benefit.discount_percent_on_additional_services,
          discount_percent_on_room_price: @vip_customers_benefit.discount_percent_on_room_price,
          discount_type: @vip_customers_benefit.discount_type, status: @vip_customers_benefit.status
        }
      }
    end

    assert_redirected_to vip_customers_benefit_url(VipCustomersBenefit.reorder(id: :desc).first)
  end

  test "should show vip_customers_benefit" do
    get vip_customers_benefit_url(@vip_customers_benefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_vip_customers_benefit_url(@vip_customers_benefit)
    assert_response :success
  end

  test "should update vip_customers_benefit" do
    patch vip_customers_benefit_url(@vip_customers_benefit), params: {
      vip_customers_benefit: {
        customer_id:  @customers.id,
        discount_amount_on_additional_services: @vip_customers_benefit.discount_amount_on_additional_services,
        discount_amount_on_room_price: @vip_customers_benefit.discount_amount_on_room_price,
        discount_percent_on_additional_services: @vip_customers_benefit.discount_percent_on_additional_services,
        discount_percent_on_room_price: @vip_customers_benefit.discount_percent_on_room_price,
        discount_type: @vip_customers_benefit.discount_type, status: @vip_customers_benefit.status
      }
    }
    assert_redirected_to vip_customers_benefit_url(@vip_customers_benefit)
  end

  test "should destroy vip_customers_benefit" do
    assert_difference("VipCustomersBenefit.count", -1) do
      delete vip_customers_benefit_url(@vip_customers_benefit)
    end

    assert_redirected_to vip_customers_benefits_url
  end
end
