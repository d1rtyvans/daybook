require "spec_helper"

require "fileutils"

module Daybook
  RSpec.describe Cli do
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
        FileUtils.rm_rf(Dir.glob("entries/*"))
      end

      after do
        FileUtils.rm_rf(Dir.glob("entries/*"))
      end

      it "writes input to a markdown file named with today's date" do
        expect { described_class.new(i: i).run }.to change { Dir["entries/*.md"].count }.by(1)

        entry = Dir["entries/*.md"].first
        expect(entry).to match(/#{Date.today.strftime("%Y-%m-%d")}/)
        expect(File.read(entry)).to eq(input)
      end
    end
  end
end
