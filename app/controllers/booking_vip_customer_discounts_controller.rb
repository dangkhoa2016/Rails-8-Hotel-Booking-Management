class BookingVipCustomerDiscountsController < ApplicationController
  before_action :set_booking_vip_customer_discount, only: %i[ show edit update destroy ]

  # GET /booking_vip_customer_discounts or /booking_vip_customer_discounts.json
  def index
    @booking_vip_customer_discounts = BookingVipCustomerDiscount.all
  end

  # GET /booking_vip_customer_discounts/1 or /booking_vip_customer_discounts/1.json
  def show
  end

  # GET /booking_vip_customer_discounts/new
  def new
    @booking_vip_customer_discount = BookingVipCustomerDiscount.new
  end

  # GET /booking_vip_customer_discounts/1/edit
  def edit
  end

  # POST /booking_vip_customer_discounts or /booking_vip_customer_discounts.json
  def create
    @booking_vip_customer_discount = BookingVipCustomerDiscount.new(booking_vip_customer_discount_params)

    respond_to do |format|
      if @booking_vip_customer_discount.save
        format.html { redirect_to @booking_vip_customer_discount, notice: "Booking vip customer discount was successfully created." }
        format.json { render :show, status: :created, location: @booking_vip_customer_discount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_vip_customer_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_vip_customer_discounts/1 or /booking_vip_customer_discounts/1.json
  def update
    respond_to do |format|
      if @booking_vip_customer_discount.update(booking_vip_customer_discount_params)
        format.html { redirect_to @booking_vip_customer_discount, notice: "Booking vip customer discount was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_vip_customer_discount }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_vip_customer_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_vip_customer_discounts/1 or /booking_vip_customer_discounts/1.json
  def destroy
    @booking_vip_customer_discount.destroy!

    respond_to do |format|
      format.html { redirect_to booking_vip_customer_discounts_path, status: :see_other, notice: "Booking vip customer discount was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_vip_customer_discount
      @booking_vip_customer_discount = BookingVipCustomerDiscount.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_vip_customer_discount_params
      params.expect(booking_vip_customer_discount: [ :booking_id, :customer_id, :discount_type, :discount_percent_on_room_price, :discount_percent_on_additional_services, :discount_amount_on_room_price, :discount_amount_on_additional_services ])
    end
end
