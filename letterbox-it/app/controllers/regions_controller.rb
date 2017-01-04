class RegionsController < ApplicationController
  before_action :require_login
  before_action :require_admin
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_admin, only: [:index, :request]

  # GET /regions
  # GET /regions.json
  # All users can only see the regions they are approved for.
  def index
    @regions = current_user.regions
  end

  # Only admin has access to this!
  def manage_all
    @regions = Region.all
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to manage_all_regions_path, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name, :country, :latitude, :longitude)
    end

    def require_admin
      unless current_user.is_admin?
        flash[:error] = "You must be an admin user to access regions."
        redirect_to sign_in_path
      end
    end
end
