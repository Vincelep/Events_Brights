class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user_params = params.permit(:first_name, :last_name, :description)
    @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to admin_users_path, :notice => "Profil mis à jour"
      else
        render :show
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

end
