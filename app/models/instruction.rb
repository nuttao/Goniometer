class Instruction < ActiveRecord::Base
  belongs_to :motion

  def to_json
  	{
			id: self.id,
			motion_id: self.motion_id,
			motion: self.motion.to_json,
			name: self.name,
			description: self.description,
			axis_mode: self.axis_mode,
			order_no: self.order_no,
			image_url: ''  		
  	}
  end
end
