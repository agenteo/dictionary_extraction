require 'spec_helper'

module DictionaryExtraction

  describe Validator do

    describe "#dictionary" do
      context "with a dictionary with no alphanumeric entry" do
        let(:dictionary) { ['AAAS'] }

        it "should have one entry" do
          validator = Validator.new(dictionary)
          validator.result.size.should == 1
        end

      end

      context "with a dictionary with one alphanumeric entry" do
        let(:dictionary) { ['7th', 'AAAS'] }

        it "should have one entry" do
          validator = Validator.new(dictionary)
          validator.result.size.should == 1
        end
      end

      context "with a dictionary with two alphanumeric entry" do
        let(:dictionary) { ['7th', "z's", 'AAAS'] }

        it "should have one entry" do
          validator = Validator.new(dictionary)
          validator.result.size.should == 1
        end
      end
    end
  end
end
