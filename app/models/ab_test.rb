class AbTest < TestDefinition
  field :question

  mount_uploader :image_a, ImageUploader
  mount_uploader :image_b, ImageUploader

  attr_accessible :image_a, 
                  :image_a_cache,
                  :image_b,
                  :image_b_cache,
                  :question,
                  :title,
                  :active,
                  :user_goal

  def aggregate_result

    if a_count > b_count
      diff = a_count - b_count
      pct = (diff * 100 / b_count).to_i
      "A by #{pct}%"
    elsif b_count > a_count
      diff = b_count - a_count
      pct = (diff * 100 / a_count).to_i
      "B by #{pct}%"
    else
      "Dead heat"
    end
  end

  def winner
    a_count = results.where(:answer => "A").count
    b_count = results.where(:answer => "B").count

    if a_count > b_count
      "A"
    elsif b_count > a_count
      "B"
    else
      "Dead heat"
    end
  end
end