class Clients::AbTestsController < Clients::BaseController
  inherit_resources
  
  def create
    @ab_test = AbTest.new params[:ab_test]
    @ab_test.author = current_user
    if @ab_test.save
      flash[:notice] = "A/B test successfully created."
      redirect_to clients_ab_test_path(@ab_test)
    else
      render :new
    end
  end
end