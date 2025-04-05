require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h2", text: "Reviews"
  end

  test "should create review" do
    visit reviews_url
    click_on "New review"

    fill_in "Comment", with: @review.comment
    find("#review_customer_id").find("option[value='#{@review.customer_id}']").select_option
    find("#review_room_id").find("option[value='#{@review.room_id}']").select_option
    fill_in "Room rating", with: @review.room_rating
    fill_in "Service rating", with: @review.service_rating
    chk = find("#review_status")
    chk.click if chk.value != @review.status && chk.checked?
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back", match: :first
  end

  test "should update Review" do
    visit review_url(@review)
    click_on "Edit", match: :first

    fill_in "Comment", with: @review.comment
    find("#review_customer_id").find("option[value='#{@review.customer_id}']").select_option
    find("#review_room_id").find("option[value='#{@review.room_id}']").select_option
    fill_in "Room rating", with: @review.room_rating
    fill_in "Service rating", with: @review.service_rating
    chk = find("#review_status")
    chk.click if chk.value != @review.status && chk.checked?
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Review" do
    visit review_url(@review)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
