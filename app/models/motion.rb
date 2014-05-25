class Motion < ActiveRecord::Base
  belongs_to :body_part

  validates :body_part_id, presence: true
  validates :name, presence: true, uniqueness: {scope: :body_part_id}
  validates :image, presence: true

  has_attached_file :image,
                    :styles => {:large => '500x500>', :medium => '300x300>', :thumb => "150x150", :icon => '32x32#'},
                    :default_style => :thumb,
                    :url => "/files/:class/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/files/:class/:attachment/:id/:style/:basename.:extension", 
                    :default_url => "/files/missing/:class/:style.png"
  
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }


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
