require_relative "lib/autoscale/queue/delayed/job/version"

Gem::Specification.new do |spec|
  spec.name = "autoscale-queue-delayed-job"
  spec.version = Autoscale::Queue::Delayed::Job::VERSION
  spec.authors = ["Michael R. van Rooijen"]
  spec.email = ["support@autoscale.app"]
  spec.license = "MIT"

  spec.summary = "Produces Delayed Job queue metrics for the Autoscale.app Agent"
  spec.homepage = "https://autoscale.app"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/autoscale-queue-delayed-job"
  spec.metadata["source_code_uri"] = "https://github.com/autoscale-app/ruby-queue-delayed-job"
  spec.metadata["changelog_uri"] = "https://github.com/autoscale-app/ruby-queue-delayed-job/blob/master/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/autoscale-app/ruby-queue-delayed-job/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*", "README.md", "CHANGELOG.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.7.0"
end
