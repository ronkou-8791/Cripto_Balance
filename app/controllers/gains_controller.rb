class GainsController < ApplicationController
  before_action :set_gain, only: [:show, :edit, :update, :destroy]

  # GET /gains
  # GET /gains.json
  def index
    @gains = Gain.all
  end

  # GET /gains/1
  # GET /gains/1.json
  def show
  end

  # GET /gains/new
  def new
    @gain = Gain.new
  end

  # GET /gains/1/edit
  def edit
  end

  # POST /gains
  # POST /gains.json
  def create
    @gain = Gain.new(gain_params)

    respond_to do |format|
      if @gain.save
        format.html { redirect_to @gain, notice: 'Gain was successfully created.' }
        format.json { render :show, status: :created, location: @gain }
      else
        format.html { render :new }
        format.json { render json: @gain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gains/1
  # PATCH/PUT /gains/1.json
  def update
    respond_to do |format|
      if @gain.update(gain_params)
        format.html { redirect_to @gain, notice: 'Gain was successfully updated.' }
        format.json { render :show, status: :ok, location: @gain }
      else
        format.html { render :edit }
        format.json { render json: @gain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gains/1
  # DELETE /gains/1.json
  def destroy
    @gain.destroy
    respond_to do |format|
      format.html { redirect_to gains_url, notice: 'Gain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gain
      @gain = Gain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gain_params
      params.require(:gain).permit(:gain_price, :purchase_price, :currrent_price)
    end
end
