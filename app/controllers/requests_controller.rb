class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :approve]
  before_action :require_login
  before_action :require_admin, only: [:manage_all, :approve]

  # GET /requests
  # GET /requests.json
  def index
    @requests = current_user.requests
  end

  # For the admin to approve requests
  def manage_all
    @requests = Request.all
  end

  # Admin approves a pending request
  def approve

    user = User.find(@request.user_id)
    user.regions << Region.find(@request.city)
    if user.regions.length == 1
      user.default_region = @request.city
    end
    
    user.save

    @request.destroy
    respond_to do |format|
      format.html { redirect_to manage_all_requests_path, notice: 'Request was successfully approved.' }
      format.json { head :no_content }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.country = Region.find(request_params[:city]).country

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update

    success = @request.update(request_params)
    if success
      @request.country = Region.find(request_params[:city]).country
      @request.save
    end
    respond_to do |format|
      if success
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    path = requests_url
    # If destroying a non-admin user's request, redirect to the admin path
    if current_user.is_admin and @request.user.id != current_user.id
      path = manage_all_requests_path
    end

    @request.destroy
    respond_to do |format|
      format.html { redirect_to path, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:user_id, :city, :country, :comments)
    end

    def require_admin
      unless current_user.is_admin?
        flash[:error] = "You must be an admin user to access regions."
        redirect_to sign_in_path
      end
    end
end
