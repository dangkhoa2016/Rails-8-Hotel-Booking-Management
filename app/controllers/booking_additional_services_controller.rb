class BookingAdditionalServicesController < ApplicationController
  include IndexConcern
  before_action :set_booking_additional_service, only: %i[ show edit update destroy ]

  # GET /booking_additional_services/1 or /booking_additional_services/1.json
  def show
  end

  # GET /booking_additional_services/new
  def new
    @booking_additional_service = BookingAdditionalService.new
  end

  # GET /booking_additional_services/1/edit
  def edit
  end

  # POST /booking_additional_services or /booking_additional_services.json
  def create
    @booking_additional_service = BookingAdditionalService.new(booking_additional_service_params)

    respond_to do |format|
      if @booking_additional_service.save
        format.html { redirect_to @booking_additional_service, notice: "Booking additional service was successfully created." }
        format.json { render :show, status: :created, location: @booking_additional_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_additional_services/1 or /booking_additional_services/1.json
  def update
    respond_to do |format|
      if @booking_additional_service.update(booking_additional_service_params)
        format.html { redirect_to @booking_additional_service, notice: "Booking additional service was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_additional_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_additional_services/1 or /booking_additional_services/1.json
  def destroy
    @booking_additional_service.destroy!

    respond_to do |format|
      format.html { redirect_to booking_additional_services_path, status: :see_other, notice: "Booking additional service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_additional_service
      @booking_additional_service = BookingAdditionalService.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_additional_service_params
      params.expect(booking_additional_service: [ :additional_service_id, :reservation_id, :note, :quantity, :unit, :total_price ])
    end
end
