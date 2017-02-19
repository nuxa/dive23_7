Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.mailer_sender = 'noreply@yourdomain'

  if Rails.env.production?
    config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"], ENV["FACEBOOK_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :twitter, ENV["TWITTER_ID_PRODUCTION"], ENV["TWITTER_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
  else
    config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"], ENV["FACEBOOK_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :twitter, ENV["TWITTER_ID_DEVELOPMENT"], ENV["TWITTER_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
  end
end
