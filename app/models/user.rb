class User < ActiveRecord::Base
  has_many :pokemon

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.username = auth.info.nickname
    user.image_url = auth.info.image
    user.token = auth.credentials.token

    user.save

    user
  end
end
