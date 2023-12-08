module Daybook
  class Cli
    include Mixins::Configurable

    def initialize(i: $stdin)
      @i = i
    end

    def run
      entry do |out|
        i.readlines.each do |line|
          out << line
        end
      end
    end

    private

    def entry(&block)
      File.open(entry_filepath, "w", &block)
    end

    def entry_filepath
      File.join(config.entry_dir, "#{entry_date}.#{config.file_extension}")
    end

    def entry_date
      Date.today.strftime(config.date_format)
    end

    attr_reader :i
  end
end
