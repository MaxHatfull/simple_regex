require_relative "spec_helper"
require_relative "../lib/simple_regex"

describe SimpleRegex do
  context "with a bare string" do
    let(:regex) { described_class.new("hello") }

    it "matches the given string" do
      expect(regex.match("hello")).to eq true
    end

    it "does not match a different string" do
      expect(regex.match("goodbye")).to eq false
    end

    it "does not match an empty string" do
      expect(regex.match("")).to eq false
    end
  end

  context "with a . modifier" do
    let(:regex) { described_class.new("he.lo") }

    it "matches a string with a letter substituted" do
      expect(regex.match("hello")).to eq true
    end

    it "does not match when the wild letter is omitted" do
      expect(regex.match("helo")).to eq false
    end

    it "does not match a different string" do
      expect(regex.match("goodbye")).to eq false
    end

    it "does not match the end of the string" do
      expect(regex.match("he")).to eq false
    end
  end

  context "with a * modifier" do
    let(:regex) { described_class.new("hel*o") }

    it "matches a string with a few ls" do
      expect(regex.match("hello")).to eq true
    end

    it "matches a string with no ls" do
      expect(regex.match("heo")).to eq true
    end
  end

  context "with a * modifier followed by its character" do
    let(:regex) { described_class.new("fo*o") }

    it "matches a string with a few os" do
      expect(regex.match("foooooo")).to eq true
    end

    it "matches a string with a single o" do
      expect(regex.match("fo")).to eq true
    end

    it "does not match a string with no os" do
      expect(regex.match("f")).to eq true
    end
  end

  context "with a .* modifier" do
    let(:regex) { described_class.new("he.*")}

    it "matches when starting he" do
      expect(regex.match("hear")).to eq true
    end

    it "matches when only he" do
      expect(regex.match("he")).to eq true
    end
  end
end