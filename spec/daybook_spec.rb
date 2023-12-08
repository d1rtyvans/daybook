require "spec_helper"

RSpec.describe Daybook do
  describe ".configure" do
    let(:file_extenstion) { "txt" }

    it "yields a configuration object" do
      expect { |b| described_class.configure(&b) }.to yield_with_args(described_class::Configuration)
    end
  end
end
