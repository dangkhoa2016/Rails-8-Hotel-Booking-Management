class RoomsController < ApplicationController
  include IndexConcern
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  # def index
  #   @pagy, @rooms = pagy(Room.all)
  # end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy!

    respond_to do |format|
      format.html { redirect_to rooms_path, status: :see_other, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def room_params
      fields = params.expect(room: [ :name, :room_type_id, :hotel_location_id, :capacity, :price,
        :half_day_price_morning, :half_day_price_afternoon, :summary, :available, :status ])

      fields[:available] = fields[:available] == "active" ? true : false
      fields
    end
end
