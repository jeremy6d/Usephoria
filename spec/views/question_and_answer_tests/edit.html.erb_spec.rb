require 'spec_helper'

describe "yes_or_no_tests/edit" do
  before(:each) do
    @yes_or_no_test = assign(:yes_or_no_test, stub_model(YesOrNoTest))
  end

  it "renders the edit yes_or_no_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", yes_or_no_test_path(@yes_or_no_test), "post" do
    end
  end
end
