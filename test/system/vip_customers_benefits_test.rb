require "application_system_test_case"

class VipCustomersBenefitsTest < ApplicationSystemTestCase
  setup do
    @vip_customers_benefit = vip_customers_benefits(:one)
  end

  test "visiting the index" do
    visit vip_customers_benefits_url
    assert_selector "h1", text: "Vip customers benefits"
  end

  test "should create vip customers benefit" do
    visit vip_customers_benefits_url
    click_on "New vip customers benefit"

    fill_in "Customer", with: @vip_customers_benefit.customer_id
    fill_in "Discount amount on additional services", with: @vip_customers_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customers_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customers_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customers_benefit.discount_percent_on_room_price
    fill_in "Discount type", with: @vip_customers_benefit.discount_type
    fill_in "Status", with: @vip_customers_benefit.status
    click_on "Create Vip customers benefit"

    assert_text "Vip customers benefit was successfully created"
    click_on "Back"
  end

  test "should update Vip customers benefit" do
    visit vip_customers_benefit_url(@vip_customers_benefit)
    click_on "Edit this vip customers benefit", match: :first

    fill_in "Customer", with: @vip_customers_benefit.customer_id
    fill_in "Discount amount on additional services", with: @vip_customers_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customers_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customers_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customers_benefit.discount_percent_on_room_price
    fill_in "Discount type", with: @vip_customers_benefit.discount_type
    fill_in "Status", with: @vip_customers_benefit.status
    click_on "Update Vip customers benefit"

    assert_text "Vip customers benefit was successfully updated"
    click_on "Back"
  end

  test "should destroy Vip customers benefit" do
    visit vip_customers_benefit_url(@vip_customers_benefit)
    click_on "Destroy this vip customers benefit", match: :first

    assert_text "Vip customers benefit was successfully destroyed"
  end
end
