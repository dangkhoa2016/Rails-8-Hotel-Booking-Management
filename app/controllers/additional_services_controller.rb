class AdditionalServicesController < ApplicationController
  before_action :set_additional_service, only: %i[ show edit update destroy ]

  # GET /additional_services or /additional_services.json
  def index
    @pagy, @additional_services = pagy(AdditionalService.all)
  end

  # GET /additional_services/1 or /additional_services/1.json
  def show
  end

  # GET /additional_services/new
  def new
    @additional_service = AdditionalService.new
  end

  # GET /additional_services/1/edit
  def edit
  end

  # POST /additional_services or /additional_services.json
  def create
    @additional_service = AdditionalService.new(additional_service_params)

    respond_to do |format|
      if @additional_service.save
        format.html { redirect_to @additional_service, notice: "Additional service was successfully created." }
        format.json { render :show, status: :created, location: @additional_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_services/1 or /additional_services/1.json
  def update
    respond_to do |format|
      if @additional_service.update(additional_service_params)
        format.html { redirect_to @additional_service, notice: "Additional service was successfully updated." }
        format.json { render :show, status: :ok, location: @additional_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_services/1 or /additional_services/1.json
  def destroy
    @additional_service.destroy!

    respond_to do |format|
      format.html { redirect_to additional_services_path, status: :see_other, notice: "Additional service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_service
      @additional_service = AdditionalService.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def additional_service_params
      params.expect(additional_service: [ :name, :summary, :price, :unit, :status ])
    end
end
