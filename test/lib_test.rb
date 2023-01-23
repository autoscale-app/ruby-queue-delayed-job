require "test_helper"

class LibTest < ActiveSupport::TestCase
  test "version" do
    refute_nil Autoscale::Queue::Delayed::Job::VERSION
  end
end
