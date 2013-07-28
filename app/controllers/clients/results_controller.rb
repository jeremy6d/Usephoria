class Clients::ResultsController < Clients::BaseController
  respond_to :js
  def index
    @test = TestDefinition.find params[:test_id]
    @results = @test.results
  end
end