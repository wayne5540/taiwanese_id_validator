require 'spec_helper'
require "taiwanese_id_validator/twid_generator"

describe TwidGenerator do
  describe "#generate" do
    it "always generate valid ID" do
      fake_ids = 1000.times.map do
        TwidValidator.valid?(TwidGenerator.generate)
      end

      expect(fake_ids.all?{true}).to be true
    end

    describe "is able to fake male or female ID" do
      context "when generate female ID" do
        it "first number charactor should be 2" do
          fake_id = TwidGenerator.generate("female")
          first_number = fake_id.split(//)[1]

          expect(first_number).to eq("2")
        end
      end

      context "when generate male ID" do
        it "first number charactor should be 1" do
          fake_id = TwidGenerator.generate("male")
          first_number = fake_id.split(//)[1]

          expect(first_number).to eq("1")
        end
      end
    end
  end
end


