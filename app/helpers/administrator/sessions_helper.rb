module Administrator::SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    session[:current_section] = ""
  end

  def current_administrator
    @current_administrator ||= Administrator.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_administrator.nil?
  end

  def login_required
    redirect_to login_path if !logged_in?
  end

  def log_out
    session.delete(:user_id)
    session.delete(:current_section)
    @current_administrator = nil
  end
end
