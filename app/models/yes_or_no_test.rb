class YesOrNoTest < TestDefinition
  field :question

  mount_uploader :image, ImageUploader

  attr_accessible :image,
				  				:image_cache,
				  				:question,
				  				:title

	def aggregate_result
		yes_count = results.where(:answer => "Yes").count
		no_count = results.where(:answer => "No").count
	end
end