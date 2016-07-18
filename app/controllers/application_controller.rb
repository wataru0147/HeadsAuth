class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

	private

	def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end	

	def guest 
		@current_user.guest == true
	end


	# def non_guest 
	# 	@current_user.guest == false || @current_user.guest == nil
	# end
	# def admin
	# 	@current_user.admin == true

	# end

	def authenticate_user!
		if current_user
		else
			redirect_to root_path, :notice => "You need to have an account before accessing page"
		end
	end


	def authenticate_admin!
		if current_user.admin?
		else
			redirect_to root_path, :notice => "You are not authorized to access the page"
		end
	end
end
