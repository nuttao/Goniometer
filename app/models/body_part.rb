class BodyPart < ActiveRecord::Base

	def to_json
    {
      id: self.id,
      name: self.name,
      image_url: ''
    }
  end

end
