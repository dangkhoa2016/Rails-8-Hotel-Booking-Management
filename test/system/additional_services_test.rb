require "application_system_test_case"

class AdditionalServicesTest < ApplicationSystemTestCase
  setup do
    @additional_service = additional_services(:one)
  end

  test "visiting the index" do
    visit additional_services_url
    assert_selector "h2", text: "Additional Services"
  end

  test "should create additional service" do
    visit additional_services_url
    click_on "New additional service"

    fill_in "Name", with: @additional_service.name
    fill_in "Price", with: @additional_service.price
    chk = find("#additional_service_status")
    chk.click if chk.value != @additional_service.status && chk.checked?
    fill_in "Summary", with: @additional_service.summary
    fill_in "Unit", with: @additional_service.unit
    click_on "Create Additional Service"

    assert_text "Additional service was successfully created"
    click_on "Back", match: :first
  end

  test "should update Additional service" do
    visit additional_service_url(@additional_service)
    click_on "Edit", match: :first

    fill_in "Name", with: @additional_service.name
    fill_in "Price", with: @additional_service.price
    chk = find("#additional_service_status")
    chk.click if chk.value != @additional_service.status && chk.checked?
    fill_in "Summary", with: @additional_service.summary
    fill_in "Unit", with: @additional_service.unit
    click_on "Update Additional Service"

    assert_text "Additional service was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Additional service" do
    visit additional_service_url(@additional_service)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Additional service was successfully destroyed"
  end
end
