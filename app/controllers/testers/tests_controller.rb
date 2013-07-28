class Testers::TestsController < Testers::BaseController
  inherit_resources
  defaults resource_class: TestDefinition,
           collection_name: "tests",
           instance_name: "test"

  def show
    @result = resource.results.build
  end
end