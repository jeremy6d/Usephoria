class Answer
  include Mongoid::Document

  embedded_in :test_definition
end