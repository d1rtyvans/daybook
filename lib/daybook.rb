# frozen_string_literal: true

require "time"

require_relative "daybook/version"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!
loader.eager_load

module Daybook
  class Error < StandardError; end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
