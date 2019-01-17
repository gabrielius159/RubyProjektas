class SessionsController < ApplicationController
  # formos puslapis
  def new

  end

  # start session
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in."
      redirect_to user_path(user)
    else
      # redirect_to flash[:danger] tinka, bet render nėra HTTP request, todėl nerodytų
      flash.now[:danger] = "There was something wrong with your login information."
      render 'new'
    end
  end

  # logout
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
end