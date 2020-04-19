class UsersController < ApplicationController
  
  skip_before_action :authorised, only: [:new, :create]
  before_action :find_user, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    session[:user_id] = @user.id

    redirect_to '/welcome'

  end
  
  def show
    @posts = Post.where(:user_id => @user.id)
    @comments = Comment.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to '/posts'
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
