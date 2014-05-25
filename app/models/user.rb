class User < ActiveRecord::Base
  belongs_to :role

  before_save :encrypt_password

  attr_accessor :password, :password_confirmation

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => {:in => 4..40}, :if => :password_required?
  validates :password, :password_confirmation, :presence => true, :if => :password_required?
  validates :password, :confirmation => true, :if => :password_required?
  

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
      username: self.username.to_s,
      email: self.email.to_s,
      role_id: self.role_id,
      role: self.role.to_json
    }
  end

  # self.encrypt
  def self.encrypt(p)
    Digest::MD5.hexdigest(p)
  end

  # encrypt
  def encrypt(p)
    self.class.encrypt(p)
  end

  # verify
  def verify(p)
    return crypted_password == encrypt(p)
  end

  # encrypt_password
  def encrypt_password
    return if password.blank?
    self.crypted_password = encrypt(password)
  end

  # password_required?
  def password_required?
    (crypted_password.blank? || !password.blank? || !password_confirmation.blank?)
  end

  def to_s
    username
  end
end
