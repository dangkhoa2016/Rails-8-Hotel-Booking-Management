class VipCustomerBenefitsController < ApplicationController
  before_action :set_vip_customer_benefit, only: %i[ show edit update destroy ]

  # GET /vip_customer_benefits or /vip_customer_benefits.json
  def index
    @vip_customer_benefits = VipCustomerBenefit.all
  end

  # GET /vip_customer_benefits/1 or /vip_customer_benefits/1.json
  def show
  end

  # GET /vip_customer_benefits/new
  def new
    @vip_customer_benefit = VipCustomerBenefit.new
  end

  # GET /vip_customer_benefits/1/edit
  def edit
  end

  # POST /vip_customer_benefits or /vip_customer_benefits.json
  def create
    @vip_customer_benefit = VipCustomerBenefit.new(vip_customer_benefit_params)

    respond_to do |format|
      if @vip_customer_benefit.save
        format.html { redirect_to @vip_customer_benefit, notice: "Vip customer benefit was successfully created." }
        format.json { render :show, status: :created, location: @vip_customer_benefit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vip_customer_benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vip_customer_benefits/1 or /vip_customer_benefits/1.json
  def update
    respond_to do |format|
      if @vip_customer_benefit.update(vip_customer_benefit_params)
        format.html { redirect_to @vip_customer_benefit, notice: "Vip customer benefit was successfully updated." }
        format.json { render :show, status: :ok, location: @vip_customer_benefit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vip_customer_benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_customer_benefits/1 or /vip_customer_benefits/1.json
  def destroy
    @vip_customer_benefit.destroy!

    respond_to do |format|
      format.html { redirect_to vip_customer_benefits_path, status: :see_other, notice: "Vip customer benefit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vip_customer_benefit
      @vip_customer_benefit = VipCustomerBenefit.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vip_customer_benefit_params
      params.expect(vip_customer_benefit: [ :customer_id, :discount_type, :discount_percent_on_room_price, :discount_percent_on_additional_services, :discount_amount_on_room_price, :discount_amount_on_additional_services, :status ])
    end
end
