require 'spec_helper'

class TestUser < TestModel
  validates :twid, taiwanese_id: true
end

class TestUserAllowsNil < TestModel
  validates :twid, taiwanese_id: { allow_nil: true }
end

class TestUserNoCaseSensitive < TestModel
  validates :twid, taiwanese_id: { case_sensitive: false }
end

describe TaiwaneseIdValidator do
  describe "validation" do
    context "given the valid IDs" do
      [
        "Y144713411"
      ].each do |twid|
        it "#{twid} should be valid" do
          expect(TestUser.new(twid: twid)).to be_valid
        end

        it "#{twid} should be valid" do
          expect(TestUserAllowsNil.new(twid: nil)).to be_valid
        end

        it "#{twid} should be valid" do
          expect(TestUserNoCaseSensitive.new(twid: twid.downcase)).to be_valid
        end
      end
    end

    context "given the invalid IDs" do
      [
        "Y144",
        "Y1447134111",
        "Ya44713411",
        "Y144713410",
        "y144713411"
      ].each do |twid|
        it "#{twid} should be valid" do
          expect(TestUser.new(twid: twid)).not_to be_valid
        end
      end
    end
  end
end