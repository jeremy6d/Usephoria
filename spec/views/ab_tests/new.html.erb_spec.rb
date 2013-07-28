require 'spec_helper'

describe "ab_tests/new" do
  before(:each) do
    assign(:ab_test, stub_model(AbTest).as_new_record)
  end

  it "renders new ab_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ab_tests_path, "post" do
    end
  end
end
