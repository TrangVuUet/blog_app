module SessionsHelper
  # Logs in the given user
  def log_in(user)
    # Rails provide session method
    session[:user_id] = user.id
  end

  # Remembers a user using cookies
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Check if a user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Logout the current user
  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Forget in session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end


end