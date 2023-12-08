require "spec_helper"

module Daybook
  RSpec.describe Configuration do
    describe "#file_extension" do
      it "defaults to md" do
        expect(subject.file_extension).to eq("md")
      end

      it "allows custom file_extension" do
        subject.file_extension = "txt"
        expect(subject.file_extension).to eq("txt")
      end
    end
  end
end
