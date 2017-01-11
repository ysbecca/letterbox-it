# app/controllers/users_controller.rb
class UsersController < Clearance::UsersController
	before_action :set_user, only: [:show, :edit, :update]

	# Manage user profile
	def show
	end

	def edit
	end

	def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user].permit(:created_at, :updated_at, :email, :password, :confirmation_token, :remember_token, :firstname, :lastname, :default_region, :is_admin, :is_super_admin)
  end
end
