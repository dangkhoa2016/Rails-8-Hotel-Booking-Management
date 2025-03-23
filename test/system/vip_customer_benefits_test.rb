require "application_system_test_case"

class VipCustomerBenefitsTest < ApplicationSystemTestCase
  setup do
    @vip_customer_benefit = vip_customer_benefits(:one)
  end

  test "visiting the index" do
    visit vip_customer_benefits_url
    assert_selector "h1", text: "Vip customer benefits"
  end

  test "should create vip customer benefit" do
    visit vip_customer_benefits_url
    click_on "New vip customer benefit"

    fill_in "Customer", with: @vip_customer_benefit.customer_id
    fill_in "Discount amount on additional services", with: @vip_customer_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customer_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customer_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customer_benefit.discount_percent_on_room_price
    fill_in "Discount type", with: @vip_customer_benefit.discount_type
    fill_in "Status", with: @vip_customer_benefit.status
    click_on "Create Vip customer benefit"

    assert_text "Vip customer benefit was successfully created"
    click_on "Back"
  end

  test "should update Vip customer benefit" do
    visit vip_customer_benefit_url(@vip_customer_benefit)
    click_on "Edit this vip customer benefit", match: :first

    fill_in "Customer", with: @vip_customer_benefit.customer_id
    fill_in "Discount amount on additional services", with: @vip_customer_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customer_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customer_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customer_benefit.discount_percent_on_room_price
    fill_in "Discount type", with: @vip_customer_benefit.discount_type
    fill_in "Status", with: @vip_customer_benefit.status
    click_on "Update Vip customer benefit"

    assert_text "Vip customer benefit was successfully updated"
    click_on "Back"
  end

  test "should destroy Vip customer benefit" do
    visit vip_customer_benefit_url(@vip_customer_benefit)
    click_on "Destroy this vip customer benefit", match: :first

    assert_text "Vip customer benefit was successfully destroyed"
  end
end
