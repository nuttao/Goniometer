class BodyPart < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true

	def to_json
	    {
	      id: self.id,
	      name: self.name,
	      image_url: ''
	    }
	end

	def to_s
		name
	end
end
