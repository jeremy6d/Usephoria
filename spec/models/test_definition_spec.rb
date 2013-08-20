require 'spec_helper'

shared_examples "a test definition" do
  context "with results" do
    before do
      subject.budget = 50
      subject.payout = 1
      subject.fee = 0.5

      20.times do
        Fabricate :test_result, test_definition: subject
      end
    end

    it "should calculate balance correctly" do
      subject.balance.should == 20
    end

    it "should calculate total accrued charges correctly" do
      subject.total_charges.should == 30
    end

    it "should calculate the cost of a single result to client correctly" do
      subject.single_result_cost.should == 1.50
    end

    it "requires an author" do
      subject.author = nil
      subject.should_not be_valid
      subject.errors[:author_id].should include("can't be blank")
    end
  end
end
