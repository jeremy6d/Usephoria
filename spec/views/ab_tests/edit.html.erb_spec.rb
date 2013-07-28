require 'spec_helper'

describe "ab_tests/edit" do
  before(:each) do
    @ab_test = assign(:ab_test, stub_model(AbTest))
  end

  it "renders the edit ab_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ab_test_path(@ab_test), "post" do
    end
  end
end
