require "application_system_test_case"

class VipCustomersBenefitsTest < ApplicationSystemTestCase
  setup do
    @vip_customers_benefit = vip_customers_benefits(:one)
    @customer2 = customers(:two)
    @customer2.update_column(:customer_type, "vip")
  end

  test "visiting the index" do
    visit vip_customers_benefits_url
    assert_selector "h1", text: "VIP Customers Benefits"
  end

  test "should create vip customers benefit" do
    visit vip_customers_benefits_url
    click_on "New vip customers benefit"

    fill_in "Customer", with: @customer2.id
    fill_in "Discount amount on additional services", with: @vip_customers_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customers_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customers_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customers_benefit.discount_percent_on_room_price
    find("#vip_customers_benefit_discount_type").find("option[value='#{@vip_customers_benefit.discount_type}']").select_option
    chk = find("#vip_customers_benefit_status")
    chk.click if chk.value != @vip_customers_benefit.status && chk.checked?
    click_on "Create VIP Customers Benefit"

    assert_text "Vip customers benefit was successfully created"
    click_on "Back"
  end

  test "should update Vip customers benefit" do
    visit vip_customers_benefit_url(@vip_customers_benefit)
    click_on "Edit", match: :first

    fill_in "Customer", with: @vip_customers_benefit.customer_id
    fill_in "Discount amount on additional services", with: @vip_customers_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customers_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customers_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customers_benefit.discount_percent_on_room_price
    find("#vip_customers_benefit_discount_type").find("option[value='#{@vip_customers_benefit.discount_type}']").select_option
    chk = find("#vip_customers_benefit_status")
    chk.click if chk.value != @vip_customers_benefit.status && chk.checked?
    click_on "Update VIP Customers Benefit"

    assert_text "Vip customers benefit was successfully updated"
    click_on "Back"
  end

  test "should destroy Vip customers benefit" do
    visit vip_customers_benefit_url(@vip_customers_benefit)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Vip customers benefit was successfully destroyed"
  end
end
