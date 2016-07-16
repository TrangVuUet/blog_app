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
    byebug
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
      params.require(:user).permit(:name, :email, :hobbies,:password,
                                   :password_confirmation)
    end

end
