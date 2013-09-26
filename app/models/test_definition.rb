class TestDefinition
  include Mongoid::Document
  include Mongoid::Timestamps
  include SixthDensity::CurrencyField

  field :title, type: String
  field :active, type: Boolean, default: true
  field :user_goal, type: Integer, default: 5

  currency_field :payout, 1
  currency_field :fee, 1
  currency_field :total_charge, 10

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

  def single_result_cost
    payout + fee
  end

  def total_cost
    single_result_cost * user_goal
  end

  def payout_for! result
    Rails.logger.info "\n\n* charging #{single_result_cost} to #{author.email} in order to payout #{payout} to #{result.taker.email}\n\n\n"
    result.taker.payout! payout
    author.debit_account! single_result_cost
    push :taker_ids, result.taker_id
  end 
end