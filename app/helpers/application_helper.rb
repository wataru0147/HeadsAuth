module ApplicationHelper
  def current_user
    User.find(session[:current_user_id])
  end
end
