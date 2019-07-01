class Administrator::PagesController < ApplicationController
  layout 'administrator'

  before_action :login_required, :update_current_section

  def update_current_section
    session[:current_section] = ""
  end

  def index
  end
end
