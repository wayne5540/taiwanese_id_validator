require 'spec_helper'

class ItTestUser < TestModel
  validates :itid, international_id: true
end

class ItTestUserAllowsNil < TestModel
  validates :itid, international_id: { allow_nil: true }
end

class ItTestUserNoCaseSensitive < TestModel
  validates :itid, international_id: { case_sensitive: false }
end

class ItTestUserAllowOld < TestModel
  validates :itid, international_id: { allow_old: true }
end

describe InternationalIdValidator do
  describe "validation" do
    context "given the valid new IDs" do
      [
        "A800000014"
      ].each do |itid|
        it "#{itid} should be valid" do
          expect(ItTestUser.new(itid: itid)).to be_valid
        end

        it "#{itid} should be valid" do
          expect(ItTestUserAllowsNil.new(itid: nil)).to be_valid
        end

        it "#{itid} should be valid" do
          expect(ItTestUserNoCaseSensitive.new(itid: itid.downcase)).to be_valid
        end

        it "#{itid} should be valid" do
          expect(ItTestUserNoCaseSensitive.new(itid: itid.downcase)).to be_valid
        end
      end
    end

    context "given the valid old IDs" do
      [
        "AD00000016"
      ].each do |itid|
        it "#{itid} should not be valid" do
          expect(ItTestUser.new(itid: itid)).not_to be_valid
        end

        it "#{itid} should be valid" do
          expect(ItTestUserAllowOld.new(itid: itid)).to be_valid
        end
      end
    end

    context "given the invalid IDs" do
      [
        "A8000014",
        "A80000001411",
        "Aa00000014",
        "A800000015",
        "a800000014"
      ].each do |itid|
        it "#{itid} should not be valid" do
          expect(ItTestUser.new(itid: itid)).not_to be_valid
        end
      end
    end
  end
end
