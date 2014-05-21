class Session < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :client_uid, presence: true

  before_create :set_token

  def to_json
    {
      id: self.id,
      user: self.user.to_json,
      token: self.token
    }
  end

  private

  def set_token
    self.token = Digest::MD5.hexdigest("login user_id = #{user.id} at #{Time.now}")
  end
end
