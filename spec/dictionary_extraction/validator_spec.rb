require 'spec_helper'

module DictionaryExtraction

  describe Validator do

    describe ".valid_entries" do
      context "with a dictionary with only numeric entries" do
        let(:dictionary) { ['1st'] }

        it "should be empty" do
          validator = Validator.new(dictionary)
          valid_entries = []
          validator.valid_entries do |valid_entry|
            valid_entries << valid_entry
          end
          valid_entries.size.should == 0
        end

      end

      context "with a dictionary with no alphanumeric entry" do
        let(:dictionary) { ['AAAS'] }

        it "should have one entry" do
          validator = Validator.new(dictionary)
          valid_entries = []
          validator.valid_entries do |valid_entry|
            valid_entries << valid_entry
          end
          valid_entries.size.should == 1
        end

      end

      context "with a dictionary with one alphanumeric entry" do
        let(:dictionary) { ['7th', 'AAAS'] }

        it "should have one entry" do
          validator = Validator.new(dictionary)
          valid_entries = []
          validator.valid_entries do |valid_entry|
            valid_entries << valid_entry
          end
          valid_entries.size.should == 1
        end
      end

      context "with a dictionary with two alphanumeric entry" do
        let(:dictionary) { ['7th', "z's", 'AAAS'] }

        it "should have one entry" do
          validator = Validator.new(dictionary)
          valid_entries = []
          validator.valid_entries do |valid_entry|
            valid_entries << valid_entry
          end
          valid_entries.size.should == 1
        end

      end
    end
  end
end
