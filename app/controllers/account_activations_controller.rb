class AccountActivationsController < ApplicationController

	def edit
		user = User.authenticate(email: params[:email], params)		
		if user !user.activated? &&  user.authenticated?(:activation, params[:id])
			session[:user_id] = user.id
			user.update_attribute(:activated, true)
			user.update_attribute(:activated_at, Time.zone.now)
			flash["sucess"] =  "Account Activated, You can now login"
			redirect_to 

		else
			#invalid activation link
			flash[:danger] = "Invalid activation link"
			redirect_to root_url
		end
	end
end
