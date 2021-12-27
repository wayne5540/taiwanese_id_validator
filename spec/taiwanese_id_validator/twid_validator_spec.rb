require 'spec_helper'

describe TwidValidator do

  describe "#valid?" do
    context "when id not valid" do
      it "returns false if id too short" do
        expect( TwidValidator.valid?("E123") ).to be false
      end

      it "returns false if id too long" do
        expect( TwidValidator.valid?("Y144713411000") ).to be false
      end

      it "returns false if id calculation is wrong" do
        expect( TwidValidator.valid?("Y144713412") ).to be false
      end

      it "returns false if format is wrong" do
        expect( TwidValidator.valid?("YAC4713412") ).to be false
      end
    end

    context "when id is valid" do
      let(:id) { "Y144713411" }

      it "returns true" do
        expect( TwidValidator.valid?(id) ).to be true
      end
    end
  end
end
