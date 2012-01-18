 
require 'openid/store/filesystem'


Rails.application.config.middleware.use OmniAuth::Builder do
  
 provider :twitter,  'zIKSzZkzyZ0VM47K5WEbBg', 'RILIYuVAMM8uoLc9ZIgUVu8tP75e1RCMcrAjQNg9A'
 provider :facebook, '235989193142984', '9a6c916b5d8acdf23341ee227d9844c1'
 provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :require => 'omniauth-openid'
 provider :google_oauth2, '1094934854857.apps.googleusercontent.com', '2xyexHeGvrevNPj2ZjfpZlPd',  { :scope => "https://www.googleapis.com/auth/userinfo.email" }
  provider :github,  'd3ccfc5c9363af7f2e3c', 'c6fa72a6a2c13a12c0ef52b6fb682962a69b44cd', { :scope => "user"}
  
end
