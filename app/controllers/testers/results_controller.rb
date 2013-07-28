class Testers::ResultsController < Testers::BaseController
  def create
    @test = TestDefinition.find params[:test_id]
    @result = @test.results.build params[:test_result]

    if @result.save
      flash[:notice] = "Thank you for taking the test!"
      redirect_to testers_root_path
    else
      render "testers/tests/show"
    end
  end
end