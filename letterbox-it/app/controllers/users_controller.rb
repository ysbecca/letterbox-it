# app/controllers/users_controller.rb
class UsersController < Clearance::UsersController

  private

  def user_params
    params[:user].permit(:created_at, :updated_at, :email, :password, :confirmation_token, :remember_token, :firstname, :lastname, :default_map_centre, :is_admin, :is_super_admin)
  end
end
