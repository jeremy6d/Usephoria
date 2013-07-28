class TestDefinition
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :active, type: Boolean, default: true
  field :user_goal, type: Integer, default: 0
  field :payout, type: Integer, default: 1

  # belongs_to :author, class_name: "User"
  has_many :results, class_name: "TestResult"

  def aggregate_result
    "N/A"
  end
end