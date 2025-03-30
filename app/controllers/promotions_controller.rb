class PromotionsController < ApplicationController
  include IndexConcern
  before_action :set_promotion, only: %i[ show edit update destroy ]

  # GET /promotions or /promotions.json
  # def index
  #   @pagy, @promotions = pagy(Promotion.all)
  # end

  # GET /promotions/1 or /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions or /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)

    respond_to do |format|
      if @promotion.save
        format.html { redirect_to @promotion, notice: "Promotion was successfully created." }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1 or /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: "Promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1 or /promotions/1.json
  def destroy
    @promotion.destroy!

    respond_to do |format|
      format.html { redirect_to promotions_path, status: :see_other, notice: "Promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def promotion_params
      params.expect(promotion: [ :name, :summary, :start_date, :end_date, :discount_type, :discount_percent, :discount_amount, :status ])
    end
end
