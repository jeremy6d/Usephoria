class StaticController < ApplicationController
  skip_before_filter :hide_from_public
  
  def landing
    if(user = current_user())
      if(user.role == 'client')
        redirect_to clients_root_path
      else
        redirect_to testers_root_path
      end
      return
    end
	  render :layout => false
  end

  def method_missing method_name
    if template_exists? "/static/#{method_name}"
      render "#{method_name}"
    else
      raise ActionController::RoutingError.new("not_found")
    end
  end
end
