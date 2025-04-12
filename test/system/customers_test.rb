require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "New customer"

    fill_in "Address", with: @customer.address
    find("#customer_customer_type").find("option[value='#{@customer.customer_type}']").select_option
    fill_in "Email", with: @customer.email + ".test"
    fill_in "Encrypted password", with: @customer.encrypted_password
    fill_in "Name", with: @customer.name
    fill_in "Note", with: @customer.note
    fill_in "Phone number", with: @customer.phone_number
    find("#customer_status").find("option[value='#{@customer.status}']").select_option
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit customer_url(@customer)
    click_on "Edit this customer", match: :first

    fill_in "Address", with: @customer.address
    find("#customer_customer_type").find("option[value='#{@customer.customer_type}']").select_option
    fill_in "Email", with: @customer.email + ".test"
    fill_in "Encrypted password", with: @customer.encrypted_password
    fill_in "Name", with: @customer.name
    fill_in "Note", with: @customer.note
    fill_in "Phone number", with: @customer.phone_number
    find("#customer_status").find("option[value='#{@customer.status}']").select_option
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit customer_url(@customer)
    click_on "Destroy this customer", match: :first

    assert_text "Customer was successfully destroyed"
  end
end
