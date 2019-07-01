class Administrator::AdministratorsController < ApplicationController
  layout 'administrator'

  before_action :login_required, :update_current_section

  def update_current_section
    session[:current_section] = "administrator"
  end

  def create
    @administrator = Administrator.new administrator_params
    if @administrator.save
      flash[:success] = 'Data saved successfully'
      redirect_to administrator_administrators_path
    else
      flash.now[:danger] = @administrator.errors.full_messages.join ', '
      render :new
    end
  end

  def disable
    @administrator = Administrator.find_by_id params[:id]
    if @administrator.update(status_id: '0')
      flash[:success] = 'Administrator disabled successfully'
    else
      flash[:danger] = @administrator.errors.full_messages.join ', '
    end
    redirect_to administrator_administrators_path
  end

  def edit
    @administrator = Administrator.find_by_id params[:id]
  end

  def enable
    @administrator = Administrator.find_by_id params[:id]
    if @administrator.update(status_id: '1')
      flash[:success] = 'Administrator enabled successfully'
      redirect_to administrator_administrators_path
    else
      flash[:danger] = @administrator.errors.full_messages.join ', '
      redirect_to administrator_administrators_path
    end
  end

  def index
    params_search = params[:search]
    params_page = params[:page].nil? ? 1 : params[:page]
    @administrators = Administrator.paginate(page: params_page, per_page: 50).search_by(params_search)
    @page = params_page
    @search = params_search
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @administrator = Administrator.new
  end

  def reset_password
    @administrator = Administrator.find_by_id params[:id]
    if @administrator.update(password: '1234567890')
      flash[:success] = 'Password resetted successfully'
      redirect_to administrator_administrators_path
    else
      flash[:danger] = @administrator.errors.full_messages.join ', '
      redirect_to administrator_administrators_path
    end
  end

  def update
    @administrator = Administrator.find_by_id params[:id]
    if @administrator.update(administrator_params)
      flash[:success] = 'Data updated successfully'
      redirect_to administrator_administrators_path
    else
      flash.now[:danger] = @administrator.errors.full_messages.join ', '
      render :new
    end
  end

  private

    def administrator_params
      params[:administrator][:section_list] = [] if params[:administrator][:section_list].nil?
      params[:administrator][:role_list] = [] if params[:administrator][:role_list].nil?
      params.require(:administrator).permit(:name, :user_name, { section_list: [] }, { role_list: [] })
    end
end
