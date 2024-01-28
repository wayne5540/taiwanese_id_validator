require 'spec_helper'

describe ItidValidator do

  describe "#valid?" do
    context "when id not valid" do
      it "returns false if id too short" do
        expect( ItidValidator.valid?("A8000") ).to be false
      end

      it "returns false if id too long" do
        expect( ItidValidator.valid?("A800000014111") ).to be false
      end

      it "returns false if id calculation is wrong" do
        expect( ItidValidator.valid?("A800000013") ).to be false
      end

      it "returns false if format is wrong" do
        expect( ItidValidator.valid?("YAC4713412") ).to be false
      end

      it "returns false if id is nil" do
        expect( ItidValidator.valid?(nil) ).to be false
      end

      it "returns false if id is nil" do
        expect( ItidValidator.valid?(1) ).to be false
      end
    end

    context "when id is valid" do
      let(:id) { "A800000014" }

      it "returns true" do
        expect( ItidValidator.valid?(id) ).to be true
      end
    end
  end
end
