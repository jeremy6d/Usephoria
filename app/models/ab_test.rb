class AbTest < TestDefinition
  field :question

  mount_uploader :image_a, ImageUploader
  mount_uploader :image_b, ImageUploader

  attr_accessible :image_a, 
                  :image_a_cache,
                  :image_b,
                  :image_b_cache,
                  :question,
                  :title

  def aggregate_result
    a_count = results.where(:answer => "A").count
    b_count = results.where(:answer => "B").count

    "A [#{a_count}], B [#{b_count}]"
  end
end