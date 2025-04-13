require "test_helper"

class AdditionalServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional_service = additional_services(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get additional_services_url
    assert_response :success
  end

  test "should get new" do
    get new_additional_service_url
    assert_response :success
  end

  test "should create additional_service" do
    assert_difference("AdditionalService.count") do
      post additional_services_url, params: { additional_service: { name: @additional_service.name, price: @additional_service.price, status: @additional_service.status, summary: @additional_service.summary, unit: @additional_service.unit } }
    end

    assert_redirected_to additional_service_url(AdditionalService.reorder(id: :desc).first)
  end

  test "should show additional_service" do
    get additional_service_url(@additional_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_additional_service_url(@additional_service)
    assert_response :success
  end

  test "should update additional_service" do
    patch additional_service_url(@additional_service), params: { additional_service: { name: @additional_service.name, price: @additional_service.price, status: @additional_service.status, summary: @additional_service.summary, unit: @additional_service.unit } }
    assert_redirected_to additional_service_url(@additional_service)
  end

  test "should destroy additional_service" do
    assert_difference("AdditionalService.count", -1) do
      delete additional_service_url(@additional_service)
    end

    assert_redirected_to additional_services_url
  end
end
