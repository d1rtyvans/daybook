require "spec_helper"

require "fileutils"

module Daybook
  RSpec.describe Cli do
    before do
      Daybook.configure do |config|
        config.entry_dir = entry_dir
      end
    end

    let(:entry_dir) { "tmp/entries" }
    let(:entry_path) { File.join(entry_dir, "#{Date.today.strftime("%Y-%m-%d")}.#{Daybook.configuration.file_extension}") }
    let(:entry) { Dir[entry_path].first }

    describe "#run" do
      let(:i) { double("stdin", readlines: readlines) }
      let(:readlines) { input.split("\n").map { |line| line + "\n" } }
      let(:input) do
        <<~INPUT
          # Hello, world!

          ## This is a test.
          It is only a test.
        INPUT
      end

      before do
        FileUtils.rm_rf(File.join(entry_dir))
      end

      after do
        FileUtils.rm_rf(File.join(entry_dir))
      end

      it "writes input to a markdown file named with today's date" do
        expect { described_class.new(i: i).run }.to change { Dir[entry_path].count }.by(1)

        expect(entry).not_to be_nil
        expect(File.read(entry)).to eq(input)
      end

      context "with multiple entries in the same say" do
        before do
          described_class.new(i: i).run
          expect(entry).not_to be_nil, "Test setup failed"
        end

        it "appends input to the existing entry" do
          expect { described_class.new(i: i).run }.not_to change { Dir[entry_path].count }
          expect(File.read(entry)).to eq(input + input)
        end
      end

      context "when entry_dir does not exist" do
        let(:entry_dir) { "tmp/foo/bar" }

        it "creates the entry_dir" do
          expect { described_class.new(i: i).run }.to change { Dir[entry_path].count }.by(1)
          expect(entry).not_to be_nil
        end
      end
    end
  end
end
