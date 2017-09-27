class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  # GET /shares
  # GET /shares.json
  def index
    #binding.pry
    @shares = Share.all
    #@shares = CSV.read('eth.com.csv')
    #@shares.each {|share| Share.create(create_at: Time.strptime(share[0], "%Y年%m月%d日"), btcjpy: share[1].gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i)}


  end

  # GET /shares/1
  # GET /shares/1.json
  def show
    id = params[:id] #=> id = 1
    ask = params[:ask] #=> ask = '売却量'
    bitjpy = params[:bitjpy]
    create_at = params[:create_at]
    ask_create_at = params[:ask_create_at]
  end

  # GET /shares/new
  def new
    @share = Share.new
  end

  # GET /shares/1/edit
  def edit
  end

  # POST /shares
  # POST /shares.json
  def create
    @share = Share.new(share_params)
    #binding.pry
    start_day = "#{params[:share][params[:share].keys[0]]}-#{params[:share][params[:share].keys[1]]}-#{params[:share][params[:share].keys[2]]}"
    end_day = "#{params[:share][params[:share].keys[4]]}-#{params[:share][params[:share].keys[5]]}-#{params[:share][params[:share].keys[6]]}"
    format_start_day = Time.strptime(start_day, "%Y-%m-%d")
    format_end_day = Time.strptime(end_day, "%Y-%m-%d")

    #binding.pry
    @bit_coin = Share.find_by(create_at: format_start_day).btcjpy * params[:share][:amount].to_f
    @ask_coin = Share.find_by(create_at: format_end_day).btcjpy *  params[:share][:ask].to_f
    respond_to do |format|
        format.html { render :show}
        # format.json { render :show, status: :created, location: @share }
    end
  end

  # PATCH/PUT /shares/1
  # PATCH/PUT /shares/1.json
  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: '通貨購入情報が編集されました' }
        format.json { render :show, status: :ok, location: @share }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url, notice: 'Share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_params
      params.require(:share).permit(:create_at, :coin, :btcjpy, :amount, :ask_create_at, :ask)
    end
end
