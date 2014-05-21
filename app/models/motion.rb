class Motion < ActiveRecord::Base
  belongs_to :body_part

  def to_json
    {
      id: self.id,
      name: self.name,
      body_part: self.body_part.to_json,
      image_url: ''
    }
  end
  
end
