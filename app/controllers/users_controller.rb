class UsersController < ApplicationController
  


  def new
  	@user = User.new
  end

  def create
	  @user = params[:user] ? User.new(user_params) : User.new_guest
	  if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
	    redirect_to root_url, :notice => "Signed up!"
	  else
    	render "new"
	  end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password_hash, :password_salt, :password, :password_confirmation,:first_name, :last_name, :contact_number)
  end
end
