require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    config.root = File.expand_path("..", __dir__)
    config.load_defaults 7.0
    config.generators.system_tests = nil
    config.active_job.queue_adapter = :delayed_job
    config.eager_load = true
  end
end
