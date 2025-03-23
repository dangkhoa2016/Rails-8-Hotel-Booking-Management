require "application_system_test_case"

class PromotionsTest < ApplicationSystemTestCase
  setup do
    @promotion = promotions(:one)
  end

  test "visiting the index" do
    visit promotions_url
    assert_selector "h1", text: "Promotions"
  end

  test "should create promotion" do
    visit promotions_url
    click_on "New promotion"

    fill_in "Discount amount", with: @promotion.discount_amount
    fill_in "Discount percent", with: @promotion.discount_percent
    fill_in "Discount type", with: @promotion.discount_type
    fill_in "End date", with: @promotion.end_date
    fill_in "Name", with: @promotion.name
    fill_in "Start date", with: @promotion.start_date
    fill_in "Status", with: @promotion.status
    fill_in "Summary", with: @promotion.summary
    click_on "Create Promotion"

    assert_text "Promotion was successfully created"
    click_on "Back"
  end

  test "should update Promotion" do
    visit promotion_url(@promotion)
    click_on "Edit this promotion", match: :first

    fill_in "Discount amount", with: @promotion.discount_amount
    fill_in "Discount percent", with: @promotion.discount_percent
    fill_in "Discount type", with: @promotion.discount_type
    fill_in "End date", with: @promotion.end_date
    fill_in "Name", with: @promotion.name
    fill_in "Start date", with: @promotion.start_date
    fill_in "Status", with: @promotion.status
    fill_in "Summary", with: @promotion.summary
    click_on "Update Promotion"

    assert_text "Promotion was successfully updated"
    click_on "Back"
  end

  test "should destroy Promotion" do
    visit promotion_url(@promotion)
    click_on "Destroy this promotion", match: :first

    assert_text "Promotion was successfully destroyed"
  end
end
