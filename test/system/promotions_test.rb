require "application_system_test_case"

class PromotionsTest < ApplicationSystemTestCase
  setup do
    @promotion = promotions(:one)
  end

  test "visiting the index" do
    visit promotions_url
    assert_selector "h2", text: "Promotions"
  end

  test "should create promotion" do
    visit promotions_url
    click_on "New promotion"

    fill_in "Discount amount", with: @promotion.discount_amount
    fill_in "Discount percent", with: @promotion.discount_percent
    find("#promotion_discount_type").find("option[value='#{@promotion.discount_type}']").select_option
    fill_in "End date", with: @promotion.end_date
    fill_in "Name", with: @promotion.name + " new"
    fill_in "Start date", with: @promotion.start_date
    chk = find("#promotion_status")
    chk.click if chk.value != @promotion.status && chk.checked?
    fill_in "Summary", with: @promotion.summary
    click_on "Create Promotion"

    assert_text "Promotion was successfully created"
    click_on "Back", match: :first
  end

  test "should update Promotion" do
    visit promotion_url(@promotion)
    click_on "Edit", match: :first

    fill_in "Discount amount", with: @promotion.discount_amount
    fill_in "Discount percent", with: @promotion.discount_percent
    find("#promotion_discount_type").find("option[value='#{@promotion.discount_type}']").select_option
    fill_in "End date", with: @promotion.end_date
    fill_in "Name", with: @promotion.name + " updated"
    fill_in "Start date", with: @promotion.start_date
    chk = find("#promotion_status")
    chk.click if chk.value != @promotion.status && chk.checked?
    fill_in "Summary", with: @promotion.summary
    click_on "Update Promotion"
    puts "@promotion.reload.status: #{@promotion.reload.status}"
    assert_text "Promotion was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Promotion" do
    visit promotion_url(@promotion)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Promotion was successfully destroyed"
  end
end
