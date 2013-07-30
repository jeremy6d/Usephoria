require 'spec_helper'

describe TestDefinition do
  subject { Fabricate :test_definition }

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
  end
end
