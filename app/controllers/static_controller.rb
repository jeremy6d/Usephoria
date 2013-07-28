class StaticController < ApplicationController
  def dashboard
  end
  def landing
	  render :layout => false
  end
end
