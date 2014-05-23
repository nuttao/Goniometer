class Patient < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true

  def to_json
    {
      id: self.id,
      user_id: self.user_id,
      name: self.name,
      gender: self.gender,
      age: self.age
    }
  end
  
  def to_s
    name
  end
end
