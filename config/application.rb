require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RegistersUpvote
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Add recommended security headers and apply a basic lenient Content Security Policy
    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'DENY',
      'X-XSS-Protection' => '1; mode=block',
      'X-Content-Type-Options' => 'nosniff',
      'Content-Security-Policy' => "default-src 'self'; " +
        "font-src data:; " +
        "img-src 'self'; " +
        "object-src 'none'; " +
        # the script digests are for the two inline scripts in govuk_template.gem:govuk_template.html.erb
        # if the scripts in that file change, or more are added, use a command similar to
        # this to generate the digests:
        # `echo "'sha256-"$(echo -n "inline javascript text" | openssl dgst -sha256 -binary | openssl enc -base64)"'"`
        "script-src 'self' 'unsafe-eval' 'sha256-+6WnXIl4mbFTCARd8N3COQmT3bJJmo32N8q8ZSQAIcU=' 'sha256-G29/qSW/JHHANtFhlrZVDZW1HOkCDRc78ggbqwwIJ2g=' 'unsafe-inline'; " +
        "style-src 'self' 'unsafe-inline'"
    }
  end
end
