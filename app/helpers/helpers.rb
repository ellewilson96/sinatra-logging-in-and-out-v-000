class Helpers
  def current_user(session)
    user = @session[:user_id]
    user
  end

  def is_logged_in?
  end
end
