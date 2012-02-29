 
require 'openid/store/filesystem'


Rails.application.config.middleware.use OmniAuth::Builder do
  
 provider :twitter,  'sectret key goes here', 'sectret goes here'
 provider :facebook, 'sectret key goes here', 'sectret goes here'
 provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :require => 'omniauth-openid'
 provider :google_oauth2, 'sectret goes here.apps.googleusercontent.com', 'sectret goes here',  { :scope => "https://www.googleapis.com/auth/userinfo.email" }
 provider :github,  'sectret key goes here', 'sectret goes here', { :scope => "user"}
  
end
