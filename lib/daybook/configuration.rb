module Daybook
  class Configuration
    DEFAULTS = {
      entry_dir: "entries",
      date_format: "%Y-%m-%d",
      file_extension: "md",
    }.freeze

    attr_writer :entry_dir,
                :date_format,
                :file_extension

    def file_extension
      @file_extension ||= DEFAULTS[:file_extension]
    end

    def date_format
      @date_format ||= DEFAULTS[:date_format]
    end

    def entry_dir
      @entry_dir ||= DEFAULTS[:entry_dir]
    end
  end
end
