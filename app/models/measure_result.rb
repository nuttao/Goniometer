class MeasureResult < ActiveRecord::Base
  belongs_to :measure

  def to_json
  	{
			id: self.id,
			measure_id: self.measure_id,
			measure: self.measure.to_json,
			order_no: self.order_no,
			name: self.name,
			value: self.value  		
  	}
  end
end
