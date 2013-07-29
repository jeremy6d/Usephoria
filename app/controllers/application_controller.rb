class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :hide_from_public

protected
  def hide_from_public
    request_http_basic_authentication unless authenticate_with_http_basic { |u, p| 
      u == "rvasw" && p == "bitcoin"
    } 
  end
end
