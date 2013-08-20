class TestDefinition
  include Mongoid::Document
  include Mongoid::Timestamps
  include SixthDensity::CurrencyField

  field :title, type: String
  field :active, type: Boolean, default: true
  field :user_goal, type: Integer, default: 5

  currency_field :payout, 1
  currency_field :budget
  currency_field :fee, 0.5

  belongs_to :author, class_name: "User",
                      inverse_of: :tests_created
  has_and_belongs_to_many :takers, class_name: "User",
                                   inverse_of: nil
  has_many :results, class_name: "TestResult"

  validates :author_id, presence: true
  validates :title, presence: true
  validates :user_goal, numericality: { greater_than: 0 }

  scope :active, where(active: true)

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