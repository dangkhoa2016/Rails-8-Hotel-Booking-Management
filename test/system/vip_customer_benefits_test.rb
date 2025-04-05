require "application_system_test_case"

class VipCustomerBenefitsTest < ApplicationSystemTestCase
  setup do
    @vip_customer_benefit = vip_customer_benefits(:one)
    @customer2 = customers(:two)
    @customer2.update_column(:customer_type, "vip")
  end

  test "visiting the index" do
    visit vip_customer_benefits_url
    assert_selector "h2", text: "VIP Customer Benefits"
  end

  test "should create vip customer benefit" do
    visit vip_customer_benefits_url
    click_on "New vip customer benefit"

    find("#vip_customer_benefit_customer_id").find("option[value='#{@customer2.id}']").select_option
    fill_in "Discount amount on additional services", with: @vip_customer_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customer_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customer_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customer_benefit.discount_percent_on_room_price
    find("#vip_customer_benefit_discount_type").find("option[value='#{@vip_customer_benefit.discount_type}']").select_option
    chk = find("#vip_customer_benefit_status")
    chk.click if chk.value != @vip_customer_benefit.status && chk.checked?
    click_on "Create VIP Customer Benefit"

    assert_text "Vip customer benefit was successfully created"
    click_on "Back", match: :first
  end

  test "should update Vip customer benefit" do
    visit vip_customer_benefit_url(@vip_customer_benefit)
    click_on "Edit", match: :first

    find("#vip_customer_benefit_customer_id").find("option[value='#{@customer2.id}']").select_option
    fill_in "Discount amount on additional services", with: @vip_customer_benefit.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @vip_customer_benefit.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @vip_customer_benefit.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @vip_customer_benefit.discount_percent_on_room_price
    find("#vip_customer_benefit_discount_type").find("option[value='#{@vip_customer_benefit.discount_type}']").select_option
    chk = find("#vip_customer_benefit_status")
    chk.click if chk.value != @vip_customer_benefit.status && chk.checked?
    click_on "Update VIP Customer Benefit"

    assert_text "Vip customer benefit was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Vip customer benefit" do
    visit vip_customer_benefit_url(@vip_customer_benefit)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Vip customer benefit was successfully destroyed"
  end
end
