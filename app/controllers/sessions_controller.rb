class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:name])
    if user && user.email == params[:email]
      session[:user_id] = user.id
      flash[:success] = "Yoy logged in successfully."
      redirect_to root_path
    else
      flash.now[:danger] = "Email or password is invalid"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:danger] = "Yoy logged out successfully."
    redirect_to root_path
  end
end
