class UsersController < ApplicationController

  def show
     @user=User.find(params[:id])
     @study = @user.created_studies.only_deleted
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private 

  def user_params
    params.require(:user).permit(:nickname, :email, :introduce, :image)
  end
end
