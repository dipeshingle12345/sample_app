class UsersController < ApplicationController
  def index
    
  end
  def new
    @user = User.new
  end
  def show
     
    params[:id].to_i == 0 ? (redirect_to new_user_path , notice: "user does not exist." ): (@user = User.find(params[:id]))

  end
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  private
                              
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
