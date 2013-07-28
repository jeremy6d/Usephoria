class TestResult
  include Mongoid::Document

  field :answer,   type: String
  field :comments, type: String

  belongs_to :test_definition
  # belongs_to :tester, class_name: User

  validates :comments, length: { minimum: 140 }
end