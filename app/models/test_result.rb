class TestResult
  include Mongoid::Document

  field :answer,   type: String
  field :comments, type: String

  belongs_to :test_definition
  belongs_to :taker, class_name: "User"

  validates :comments, length: { minimum: 140 }
  validates_presence_of :answer, message: "must be provided"
  validates_presence_of :taker_id, 
                        :test_definition_id
  validates_uniqueness_of :taker_id, scope: :test_definition_id,
                                     message: "already took this test"

  after_create Proc.new { |result|  test_definition.payout_for! result }

# protected
#   def update_entities!
#     test_definition.payout_to! taker_id


#     payout_in_cents = (test_definition.payout * 100).to_i

# #   instead of this, do it in the taker method directly
# #   taker.inc(:tests_taken_count, 1).
# #         inc(:balance_in_cents, payout_in_cents)
#     taker.register_test_taken!

#     test_definition.push :taker_ids, taker_id

#     # test_owner.decremet(:balance).by(payout + fee)
#   end
end