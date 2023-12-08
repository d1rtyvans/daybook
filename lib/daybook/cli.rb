module Daybook
  class Cli
    include Mixins::Configurable

    def initialize(i: $stdin)
      @i = i
    end

    def run
      init_entry_dir
      entry do |out|
        i.readlines.each do |line|
          out << line
        end
      end
    end

    private

    def entry(&block)
      File.open(entry_filepath, write_mode, &block)
    end

    def entry_filepath
      File.join(config.entry_dir, "#{entry_date}.#{config.file_extension}")
    end

    def entry_date
      Date.today.strftime(config.date_format)
    end

    def write_mode
      entry_exists? ? "a" : "w"
    end

    def entry_exists?
      @entry_exists ||= File.exist?(entry_filepath)
    end

    def init_entry_dir
      FileUtils.mkdir_p(config.entry_dir) unless Dir.exist?(config.entry_dir)
    end

    attr_reader :i
  end
end
