 
require 'openid/store/filesystem'


Rails.application.config.middleware.use OmniAuth::Builder do
  
 provider :twitter,  'NnI9jQ7qxP40kVmHW4EA', '8uqIQr2Fx89p2SeI5jKpEDynUME7mxHg4b5rfo9SI'
 provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp'), :require => 'omniauth-openid'
 provider :google_apps, :store => OpenID::Store::Filesystem.new('/tmp'), :domain => 'gmail.com'

  
end
