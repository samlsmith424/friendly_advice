
class UsersController < ApplicationController
def new
  @user = User.new
end

def create
  user = User.new(user_params)
  if user.save(user_params)
    set_session(user)
    redirect_to advice_path
  else
    flash[:danger] = "Sorry, something went wrong. Please try again."
    redirect_to registration_path
  end
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
