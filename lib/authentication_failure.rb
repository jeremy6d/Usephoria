class AuthenticationFailure < Devise::FailureApp
  def redirect_url
    new_user_session_path
  end
  
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
