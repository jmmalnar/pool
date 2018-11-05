class Pools::ReadingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_pool
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  # GET /readings
  # GET /readings.json
  def index
    @readings = @pool.readings.all.sort_by { |reading| reading.datetime }
  end

  # GET /readings/1
  # GET /readings/1.json
  def show
  end

  # GET /readings/new
  def new
    @reading = @pool.readings.new(datetime: DateTime.now.strftime('%Y-%m-%dT%H:%M'))
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  # POST /readings.json
  def create
    @reading = @pool.readings.new(reading_params)

    respond_to do |format|
      if @reading.save
        format.html { redirect_to @pool, notice: 'Reading was successfully created.' }
        format.json { render :show, status: :created, location: @reading }
      else
        format.html { render :new }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @pool, notice: 'Reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to @pool, notice: 'The reading for ' + @reading.datetime.to_s + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:pool_id])
    end

    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:datetime, :ph, :alkalinity, :chlorine, :stabilizer, :pool_id, :airtemp, :watertemp)
    end
end
