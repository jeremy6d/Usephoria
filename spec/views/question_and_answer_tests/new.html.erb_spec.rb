require 'spec_helper'

describe "yes_or_no_tests/new" do
  before(:each) do
    assign(:yes_or_no_test, stub_model(YesOrNoTest).as_new_record)
  end

  it "renders new yes_or_no_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", yes_or_no_tests_path, "post" do
    end
  end
end
