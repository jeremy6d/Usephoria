require 'spec_helper'
require 'models/test_definition_spec'

describe AbTest do
  subject { Fabricate :ab_test }
  
  it_behaves_like "a test definition"


end
