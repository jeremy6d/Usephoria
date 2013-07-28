require 'spec_helper'

describe "ab_tests/show" do
  before(:each) do
    @ab_test = assign(:ab_test, stub_model(AbTest))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
