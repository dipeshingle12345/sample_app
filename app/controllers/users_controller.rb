class UsersController < ApplicationController
  def index
    
  end
  def new
    @user = User.new
  end
  def show
     
    params[:id].to_i == 0 ? (redirect_to users_path , notice: "user does not exist." ): (@user = User.find(params[:id]))

  end
end
