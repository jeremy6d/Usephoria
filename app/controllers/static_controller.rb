class StaticController < ApplicationController
  def dashboard
  end
  def newTest
  end
  def landing
	  render :layout => false
  end
end
