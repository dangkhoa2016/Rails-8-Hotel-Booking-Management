require "test_helper"

class PromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion = promotions(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_promotion_url
    assert_response :success
  end

  test "should create promotion" do
    assert_difference("Promotion.count") do
      post promotions_url, params: { promotion: {
          discount_amount: @promotion.discount_amount,
          discount_percent: @promotion.discount_percent,
          discount_type: @promotion.discount_type, end_date: @promotion.end_date,
          name: @promotion.name + " test", start_date: @promotion.start_date,
          status: @promotion.status, summary: @promotion.summary
        }
      }
    end

    assert_redirected_to promotion_url(Promotion.reorder(id: :desc).first)
  end

  test "should show promotion" do
    get promotion_url(@promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_promotion_url(@promotion)
    assert_response :success
  end

  test "should update promotion" do
    patch promotion_url(@promotion), params: { promotion: {
        discount_amount: @promotion.discount_amount,
        discount_percent: @promotion.discount_percent,
        discount_type: @promotion.discount_type, end_date: @promotion.end_date,
        name: @promotion.name + " test", start_date: @promotion.start_date,
        status: @promotion.status, summary: @promotion.summary
      }
    }
    assert_redirected_to promotion_url(@promotion)
  end

  test "should destroy promotion" do
    assert_difference("Promotion.count", -1) do
      delete promotion_url(@promotion)
    end

    assert_redirected_to promotions_url
  end
end
