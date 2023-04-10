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
    @user = User.new(user_params)   # Not the final implementation!
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
  private
                              
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
