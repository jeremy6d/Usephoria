class Clients::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_allow_clients

protected
  def only_allow_clients
    redirect_to testers_dashboard_path unless current_user.is_a_client?
  end  
end