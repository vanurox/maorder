Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'1759792904270188','dabb9cb79278b70bd73dde42c70bff79' , { scope: 'public_profile,email', info_fields: 'email,name,verified' }


end