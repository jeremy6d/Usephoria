class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.role == "client"
      clients_dashboard_path
    else
      testers_dashboard_path
    end
  end
end