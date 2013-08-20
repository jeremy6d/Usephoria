require 'spec_helper'

describe TestResult do
  subject { Fabricate :test_result }

  before do
    @test = subject.test_definition
    @taker = subject.taker
    @count = @taker.tests_taken_count
  end

  it "does not allow a tester to take the same test twice" do
    @duplicate = Fabricate.build :test_result, test_definition: @test,
                                               taker: @taker
    assert !@duplicate.valid?
    @duplicate.errors[:taker_id].should include("already took this test")
  end

  it "increments the taker's count" do
    @taker.tests_taken_count.should == 1
  end
end