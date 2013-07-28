class StaticController < ApplicationController
  def dashboard
  end
  def newTest
  end
  def testerDashboard
  end
  def test
  end
  def howItWorks
  end
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
end
