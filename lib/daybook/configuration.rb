module Daybook
  class Configuration
    DEFAULTS = {
      file_extension: "md"
    }.freeze

    attr_writer :file_extension

    def file_extension
      @file_extension ||= DEFAULTS[:file_extension]
    end
  end
end
