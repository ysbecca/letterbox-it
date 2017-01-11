class DistributionsController < ApplicationController
  before_action :require_login
  before_action :set_distribution, only: [:show, :edit, :update, :destroy]
  before_action :set_default_coordinates


  # GET /distributions
  # GET /distributions.json
  def index
    # TODO add all the regions the user is subscribed to
    @distributions = Distribution.where(:region_id => current_user.regions)
  end

  # GET /distributions/1
  # GET /distributions/1.json
  def show
    @editing = false
  end

  # GET /distributions/new
  def new
    @distribution = Distribution.new
    @editing = true
  end

  # GET /distributions/1/edit
  def edit
    @editing = true
  end

  # POST /distributions
  # POST /distributions.json
  def create
    @distribution = Distribution.new(distribution_params)

    respond_to do |format|
      if @distribution.save
        format.html { redirect_to @distribution, notice: 'Distribution was successfully created.' }
        format.json { render :show, status: :created, location: @distribution }
      else
        format.html { render :new }
        format.json { render json: @distribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distributions/1
  # PATCH/PUT /distributions/1.json
  def update
    respond_to do |format|
      if @distribution.update(distribution_params)
        format.html { redirect_to @distribution, notice: 'Distribution was successfully updated.' }
        format.json { render :show, status: :ok, location: @distribution }
      else
        format.html { render :edit }
        format.json { render json: @distribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distributions/1
  # DELETE /distributions/1.json
  def destroy
    @distribution.destroy
    respond_to do |format|
      format.html { redirect_to distributions_url, notice: 'Distribution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_default_coordinates
      # Default is set to Leeds for any user
      default_latitude = 53.8008
      default_longitude = -1.5491

      @latitude = current_user.default_region ? Region.find(current_user.default_region).latitude : default_latitude
      @longitude = current_user.default_region ? Region.find(current_user.default_region).longitude : default_longitude
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_distribution
      @distribution = Distribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def distribution_params
      params.require(:distribution).permit(:date, :participants, :quantity, :routes, :comments, :region_id)
    end
end
