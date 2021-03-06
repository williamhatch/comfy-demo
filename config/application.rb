require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ComfyDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Ensuring that all engines and their routes get loaded before this app.
    # This is to prevent Comfy globbing route from killing appended routes.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]

    # Let's load our custom CMS content tags
    require_relative '../lib/cms_tags/lorem_picsum'
  end
end
