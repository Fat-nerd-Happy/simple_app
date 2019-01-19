class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @micropost = @user.micropost

  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      redirect_to new_micropost_path
    else
      render 'new'
    end
  end
  
  def list
    if logged_in?
        @users_five = User.find([1,2,3,4,5])
    else
        redirect_to login_path
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  
end
