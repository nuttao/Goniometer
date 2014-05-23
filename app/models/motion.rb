class Motion < ActiveRecord::Base
  belongs_to :body_part

  validates :body_part_id, presence: true
  validates :name, presence: true, uniqueness: {scope: :body_part_id}

  def to_json
    {
      id: self.id,
      name: self.name,
      body_part: self.body_part.to_json,
      image_url: ''
    }
  end

  def to_s
    name
  end
  
end
