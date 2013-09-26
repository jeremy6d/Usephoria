require 'spec_helper'

shared_examples "a test definition" do
  it "requires an author" do
    subject.author = nil
    subject.should_not be_valid
    subject.errors[:author_id].should include("can't be blank")
  end

  context "calculating costs" do
    before do
      subject.payout = 1
      subject.fee = 0.5
      subject.user_goal = 10
    end

    it "can determine the total cost of meeting the goal correctly" do
      subject.total_cost.should == 15.00
    end

    it "can determine the cost of a single result to client correctly" do
      subject.single_result_cost.should == 1.50
    end
  end

  context "handling a payout" do
    before do
      subject.payout = 1
      subject.fee = 0.5
      subject.save

      @taker  = stub "taker",       email: "dumbdumb@dumbdumb.com",
                                    payout!: 1.0
      @result = stub "test result", taker: @taker,
                                    taker_id: :the_taker_id
    end

    it "debits the author's account balance correctly" do
      subject.author.expects(:debit_account!).with(1.50).returns(true)
      subject.payout_for! @result
    end

    it "pays out to the taker" do
      @taker.expects(:payout!).
             with(1.0).
             returns(true)
      subject.payout_for! @result
    end

    it "adds the taker to the test's list of takers" do
      subject.payout_for! @result
      subject.taker_ids.should include(:the_taker_id)
    end
  end
end