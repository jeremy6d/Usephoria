require 'spec_helper'

describe 'User' do
  context "not previously saved" do
    subject { Fabricate.build :unconfirmed_user }
  end

  context "previously confirmed as a tester" do
    subject { Fabricate :tester }

    it "knows it's not a client" do
      assert !subject.is_a_client?
    end

    it "can tell which tests have not been taken" do
      @taken_test = Fabricate :ab_test, takers: [subject]
      @untaken_test = Fabricate :ab_test

      subject.tests_not_taken.should == [@untaken_test]
    end

    it "excludes created tests from tests not taken" do
      @created_test = Fabricate :ab_test, author: subject
      subject.tests_not_taken.should_not include(@created_test)
    end
  end

  context "previously confirmed as a client" do
    subject { Fabricate :client }

    it "knows it's a client" do
      assert subject.is_a_client?
    end
  end
end