class LoveinstagramsController < ApplicationController
  before_action :set_loveinstagram, only: [:show, :edit, :update, :destroy]

  # GET /instagram
  def instagram
    @mes = Me.first
    @loveinstagrams = Loveinstagram.first
  end 

  # GET /loveinstagrams
  # GET /loveinstagrams.json
  def index
    @loveinstagrams = Loveinstagram.all
  end

  # GET /loveinstagrams/1
  # GET /loveinstagrams/1.json
  def show
  end

  # GET /loveinstagrams/new
  def new
    @loveinstagram = Loveinstagram.new
  end

  # GET /loveinstagrams/1/edit
  def edit
  end

  # POST /loveinstagrams
  # POST /loveinstagrams.json
  def create
    @loveinstagram = Loveinstagram.new(loveinstagram_params)

    respond_to do |format|
      if @loveinstagram.save
        format.html { redirect_to @loveinstagram, notice: 'Loveinstagram was successfully created.' }
        format.json { render :show, status: :created, location: @loveinstagram }
      else
        format.html { render :new }
        format.json { render json: @loveinstagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loveinstagrams/1
  # PATCH/PUT /loveinstagrams/1.json
  def update
    respond_to do |format|
      if @loveinstagram.update(loveinstagram_params)
        format.html { redirect_to @loveinstagram, notice: 'Loveinstagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @loveinstagram }
      else
        format.html { render :edit }
        format.json { render json: @loveinstagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loveinstagrams/1
  # DELETE /loveinstagrams/1.json
  def destroy
    @loveinstagram.destroy
    respond_to do |format|
      format.html { redirect_to loveinstagrams_url, notice: 'Loveinstagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loveinstagram
      @loveinstagram = Loveinstagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loveinstagram_params
      params.require(:loveinstagram).permit(:loveword)
    end
end
