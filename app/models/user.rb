class User < ActiveRecord::Base
 
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  def apply_omniauth(omniauth)
    #self.email = omniauth['user_info']['email'] if email.blank?  
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def password_required?
   (authentications.empty? || !password.blank?) && super
  end

 def self.find_for_googleapps_oauth(access_token, signed_in_resource=nil)
  data = access_token['user_info']
  if user = User.where(:email => data['email']).first
    user
  else #create a user with stub pwd
    User.create!(:email => data['email'], :password => Devise.friendly_token[0,20])
  end
end

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session['devise.googleapps_data'] && session['devise.googleapps_data']['user_info']
      user.email = data['email']
    end
  end
end
 

end
