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

  after_save :up_takers_test_count!
  after_save :note_taker_in_test!

protected
  def up_takers_test_count!
    taker.inc :tests_taken_count, 1
  end

  def note_taker_in_test!
    test_definition.push :taker_ids, taker_id
  end
end