class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to root_path
      #redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
