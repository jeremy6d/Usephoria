class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :hide_from_public, if: Proc.new { Rails.env.production? }

  def after_sign_in_path_for(resource)
    if resource.is_a_client?
      clients_dashboard_path
    else
      testers_dashboard_path
    end
  end

protected
  def hide_from_public
    request_http_basic_authentication unless authenticate_with_http_basic { |u, p| 
      u == "rvasw" && p == "bitcoin"
    } 
  end
end
