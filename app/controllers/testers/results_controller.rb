class Testers::ResultsController < Testers::BaseController
  def create
    @test = TestDefinition.find params[:test_id]
    @result = @test.results.build params[:test_results]
    
    # record who took it

    if @result.save
      render :show
    else
      render :new
    end
  end
end