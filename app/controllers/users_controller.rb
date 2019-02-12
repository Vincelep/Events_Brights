class UsersController < ApplicationController
  before_action :authenticate_user

  def show
    @user = User.find(params[:id])
  end

  def update
    user_params = params.permit(:first_name, :last_name, :description)

      if @user.update(user_params)
        redirect_to @user, :notice => "Profil mis à jour"
      else
        render :show
      end
  end

  private

    def authenticate_user
      @user = User.find(params[:id])
      if user_signed_in?
        if current_user.id != @user.id
            flash[:danger] = "Tu ne peux pas modifier le profil d'une autre personne ;)"
            redirect_to root_path
        end
      else
        flash[:danger] = "Connecte-toi pour modifier ton profil"
        redirect_to root_path
      end
    end

end
