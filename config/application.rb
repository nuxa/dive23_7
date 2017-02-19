require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Dive236
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.active_record.raise_in_transactional_callbacks = true
  end
end
