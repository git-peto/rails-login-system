class Administrator::SessionsController < ApplicationController
  layout 'login'

  def new
  end

  def create
    user = Administrator.find_by(user_name: params[:session][:user_name], status_id: 1)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to administrator_home_path
    else
      flash.now[:danger] = 'Invalid user name/password combination!'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'Anda berhasil logout!'
    redirect_to login_path
  end
end
