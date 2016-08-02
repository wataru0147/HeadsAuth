class UsersController < ApplicationController
  


  def new
  	@user = User.new
  end

  def create
	  @user = params[:user] ? User.new(user_params) : User.new_guest
	  if @user.save
    
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
      #UserMailer.account_activation(@user).deliver_now if current_user && current_user.guest == false
      flash[:notice] = "Please check your email to activate your account"
      redirect_to root_url
	  else
    	render "new"
	  end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password_hash, :password_salt, :password, :password_confirmation,:first_name, :last_name, :contact_number, :activation_digest, :activated, :activated_at)
  end
end
