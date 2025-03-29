class BookingDiscountsController < ApplicationController
  before_action :set_booking_discount, only: %i[ show edit update destroy ]

  # GET /booking_discounts or /booking_discounts.json
  def index
    @pagy, @booking_discounts = pagy(BookingDiscount.all)
  end

  # GET /booking_discounts/1 or /booking_discounts/1.json
  def show
  end

  # GET /booking_discounts/new
  def new
    @booking_discount = BookingDiscount.new
  end

  # GET /booking_discounts/1/edit
  def edit
  end

  # POST /booking_discounts or /booking_discounts.json
  def create
    @booking_discount = BookingDiscount.new(booking_discount_params)

    respond_to do |format|
      if @booking_discount.save
        format.html { redirect_to @booking_discount, notice: "Booking discount was successfully created." }
        format.json { render :show, status: :created, location: @booking_discount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_discounts/1 or /booking_discounts/1.json
  def update
    respond_to do |format|
      if @booking_discount.update(booking_discount_params)
        format.html { redirect_to @booking_discount, notice: "Booking discount was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_discount }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_discounts/1 or /booking_discounts/1.json
  def destroy
    @booking_discount.destroy!

    respond_to do |format|
      format.html { redirect_to booking_discounts_path, status: :see_other, notice: "Booking discount was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_discount
      @booking_discount = BookingDiscount.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_discount_params
      params.expect(booking_discount: [ :booking_id, :discount_type, :discount_percent, :discount_amount, :promotion_id, :reason_for_discount, :note ])
    end
end
