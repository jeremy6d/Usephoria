class TestDefinition
  include Mongoid::Document
  include Mongoid::Timestamps
  include SixthDensity::CurrencyField

  field :title, type: String
  field :active, type: Boolean, default: true
  field :user_goal, type: Integer, default: 0

  currency_field :payout, 100
  currency_field :budget
  currency_field :fee, 50

  # belongs_to :author, class_name: "User"
  has_many :results, class_name: "TestResult"

  def winner
    "N/A"
  end

  def balance
    budget - total_charges
  end

  def total_charges
    results.count * single_result_cost
  end

  def single_result_cost
    payout + fee
  end
end