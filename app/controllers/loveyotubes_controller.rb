class LoveyotubesController < ApplicationController
  before_action :set_loveyotube, only: [:show, :edit, :update, :destroy]

  # GET /loveyotubes
  # GET /loveyotubes.json
  def index
    @loveyotubes = Loveyotube.all
  end

  # GET /loveyotubes/1
  # GET /loveyotubes/1.json
  def show
  end

  # GET /loveyotubes/new
  def new
    @loveyotube = Loveyotube.new
  end

  # GET /loveyotubes/1/edit
  def edit
  end

  # POST /loveyotubes
  # POST /loveyotubes.json
  def create
    @loveyotube = Loveyotube.new(loveyotube_params)

    respond_to do |format|
      if @loveyotube.save
        format.html { redirect_to @loveyotube, notice: 'Loveyotube was successfully created.' }
        format.json { render :show, status: :created, location: @loveyotube }
      else
        format.html { render :new }
        format.json { render json: @loveyotube.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loveyotubes/1
  # PATCH/PUT /loveyotubes/1.json
  def update
    respond_to do |format|
      if @loveyotube.update(loveyotube_params)
        format.html { redirect_to @loveyotube, notice: 'Loveyotube was successfully updated.' }
        format.json { render :show, status: :ok, location: @loveyotube }
      else
        format.html { render :edit }
        format.json { render json: @loveyotube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loveyotubes/1
  # DELETE /loveyotubes/1.json
  def destroy
    @loveyotube.destroy
    respond_to do |format|
      format.html { redirect_to loveyotubes_url, notice: 'Loveyotube was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loveyotube
      @loveyotube = Loveyotube.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loveyotube_params
      params.require(:loveyotube).permit(:loveword)
    end
end
