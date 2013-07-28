require 'spec_helper'

describe "ab_tests/index" do
  before(:each) do
    assign(:ab_tests, [
      stub_model(AbTest),
      stub_model(AbTest)
    ])
  end

  it "renders a list of ab_tests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
