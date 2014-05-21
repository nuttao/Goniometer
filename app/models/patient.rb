class Patient < ActiveRecord::Base
  belongs_to :user

  def to_json
    {
      id: self.id,
      user_id: self.user_id,
      name: self.name,
      gender: self.gender,
      age: self.age
    }
  end
  
end
