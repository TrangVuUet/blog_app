class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
  end

  def show
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Write your first blog!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
