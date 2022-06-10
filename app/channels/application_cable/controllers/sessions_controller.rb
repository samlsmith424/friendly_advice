class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if authenticated?(user)
      set_session(user)
      redirect_to advice_path
    else
      flash[:danger] = "Sorry, something went wrong. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def authenticated?(user)
      user && user.authenticate(params[:password])
    end
end
