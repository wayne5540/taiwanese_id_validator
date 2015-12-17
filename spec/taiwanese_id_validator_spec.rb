require 'spec_helper'

class TestUser < TestModel
  validates :twid, taiwanese_id: true
end

describe TaiwaneseIdValidator do
  describe "validation" do
    context "given the valid IDs" do
      [
        "Y144713411",
        "y144713411"
      ].each do |twid|
        it "#{twid} should be valid" do
          expect(TestUser.new(twid: twid)).to be_valid
        end
      end
    end

    context "given the invalid IDs" do
      [
        "Y144",
        "y1447134111",
        "ya44713411",
        "y144713410"
      ].each do |twid|
        it "#{twid} should be valid" do
          expect(TestUser.new(twid: twid)).not_to be_valid
        end
      end
    end
  end
end