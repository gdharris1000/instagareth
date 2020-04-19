class SessionsController < ApplicationController
  
  skip_before_action :authorised, only: [:new, :create, :welcome]
  
  def new
  end

  def create

    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to '/welcome'
      
    else

      redirect_to '/login'
    end

  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end

  def logout
    reset_session
    redirect_to '/welcome'
  end
end
