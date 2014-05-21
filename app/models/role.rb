class Role < ActiveRecord::Base

	SYSADMIN_ID = 1
  ADMIN_ID = 2
  GENERAL_ID = 3

  def to_json
    {
      id: self.id,
      name: self.name
    }
  end

  def to_s
    name
  end
  
end
