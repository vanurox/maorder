require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Maorder
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

        config.assets.precompile += %w(admins.css)
        config.assets.precompile += %w(animate.min.css)
        config.assets.precompile += %w(custom.css)
        config.assets.precompile += %w(bootstrap.min.css)
        config.assets.precompile += %w(owl.carousel.css)
        config.assets.precompile += %w(owl.theme.css)
        config.assets.precompile += %w(owl.transitions.css)
        config.assets.precompile += %w(style.blue.css)
        config.assets.precompile += %w(style.css)
        config.assets.precompile += %w(bootstrap.css)
        config.assets.precompile += %w(bootstrap-hover-dropdown.js)
        config.assets.precompile += %w(bootstrap.min.js)
        config.assets.precompile += %w(front.js)
        config.assets.precompile += %w(jquery-1.11.0.min.js)
        config.assets.precompile += %w(jquery.cookie.js)
        config.assets.precompile += %w(jquery.flexslider.js)
        config.assets.precompile += %w(jquery.flexslider.min.js)
        config.assets.precompile += %w(main.js)
        config.assets.precompile += %w(modernizr.js)
        config.assets.precompile += %w(owl.carousel.min.js)
        config.assets.precompile += %w(respond.min.js)
        config.assets.precompile += %w(waypoints.min.js)

        config.assets.precompile += %w(jquery.js)
        config.assets.precompile += %w(code.js)
        config.assets.precompile += %w(custom.js)
        config.assets.precompile += %w(font-awesome.min.css)
        config.assets.precompile += %w(admin.css)
        config.assets.precompile += %w(boot_slider.js)
 config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host:'localhost', port: '3000' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
      :address => "smtp.gmail.com",
      :port => 587,
      :domain => 'localhost:3000',
      :user_name => "rubyrails9211@gmail.com",
      :password => "rubyonrails",
      :authentication => :plain,
      :enable_starttls_auto => true
  }
  end
end
