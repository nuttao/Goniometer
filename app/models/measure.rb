class Measure < ActiveRecord::Base
  belongs_to :user
  belongs_to :patient
  belongs_to :body_part
  belongs_to :motion

  def to_json
  	{
			id: self.id,
			user_id: self.user_id,
			user: self.user.to_json,
			patient_id: self.patient_id,
			patient: self.patient.to_json,
			body_part_id: self.body_part_id,
			body_part: self.body_part.to_json,
			motion_id: self.motion_id,
			motion: self.motion.to_json,
			description: self.description,
			measured_at: self.measured_at,
			value: self.value
  	}
  end
end
