require "spec_helper"

module Daybook
  RSpec.describe Configuration do
    describe ".date_format" do
      it "defaults to %Y-%m-%d" do
        expect(subject.date_format).to eq("%Y-%m-%d")
      end

      it "can be overridden" do
        subject.date_format = "%m-%d-%Y"
        expect(subject.date_format).to eq("%m-%d-%Y")
      end

      describe ".entry_dir" do
        it "defaults to entries" do
          expect(subject.entry_dir).to eq("entries")
        end

        it "can be overridden" do
          subject.entry_dir = "foo"
          expect(subject.entry_dir).to eq("foo")
        end
      end

      describe ".file_extension" do
        it "defaults to md" do
          expect(subject.file_extension).to eq("md")
        end

        it "can be overriden" do
          subject.file_extension = "txt"
          expect(subject.file_extension).to eq("txt")
        end
      end
    end
  end
end
