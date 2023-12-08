module Daybook
  class Cli
    ENTRIES_DIR = "entries"
    DATE_FORMAT = "%Y-%m-%d"
    FILE_EXTENSION = "md"

    def initialize(i: $stdin, entries_dir: ENTRIES_DIR)
      @i = i
      @entries_dir = entries_dir
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
      File.join(entries_dir, "#{entry_date}.#{file_extension}")
    end

    def entry_date
      Date.today.strftime(DATE_FORMAT)
    end

    def file_extension
      FILE_EXTENSION
    end

    attr_reader :i, :entries_dir
  end
end
