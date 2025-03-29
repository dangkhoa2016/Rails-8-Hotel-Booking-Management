class HotelLocationsController < ApplicationController
  before_action :set_hotel_location, only: %i[ show edit update destroy ]

  # GET /hotel_locations or /hotel_locations.json
  def index
    @pagy, @hotel_locations = pagy(HotelLocation.all)
  end

  # GET /hotel_locations/1 or /hotel_locations/1.json
  def show
  end

  # GET /hotel_locations/new
  def new
    @hotel_location = HotelLocation.new
  end

  # GET /hotel_locations/1/edit
  def edit
  end

  # POST /hotel_locations or /hotel_locations.json
  def create
    @hotel_location = HotelLocation.new(hotel_location_params)

    respond_to do |format|
      if @hotel_location.save
        format.html { redirect_to @hotel_location, notice: "Hotel location was successfully created." }
        format.json { render :show, status: :created, location: @hotel_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_locations/1 or /hotel_locations/1.json
  def update
    respond_to do |format|
      if @hotel_location.update(hotel_location_params)
        format.html { redirect_to @hotel_location, notice: "Hotel location was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_locations/1 or /hotel_locations/1.json
  def destroy
    @hotel_location.destroy!

    respond_to do |format|
      format.html { redirect_to hotel_locations_path, status: :see_other, notice: "Hotel location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_location
      @hotel_location = HotelLocation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def hotel_location_params
      params.expect(hotel_location: [ :name, :address, :manager_name, :status ])
    end
end
