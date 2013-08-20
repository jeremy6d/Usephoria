class Testers::ResultsController < Testers::BaseController
  def create
    @test = TestDefinition.find params[:test_id]
    @result = @test.results.build params[:test_result]
    @result.taker = current_user

    if @result.save
      flash[:notice] = "Thank you for taking the test!"
      redirect_to testers_dashboard_path
    else
      render "testers/tests/show"
    end
  end
end