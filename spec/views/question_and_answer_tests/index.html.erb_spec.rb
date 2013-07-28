require 'spec_helper'

describe "yes_or_no_tests/index" do
  before(:each) do
    assign(:yes_or_no_tests, [
      stub_model(YesOrNoTest),
      stub_model(YesOrNoTest)
    ])
  end

  it "renders a list of yes_or_no_tests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
