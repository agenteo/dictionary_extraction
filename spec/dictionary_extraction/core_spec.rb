require 'spec_helper'

module DictionaryExtraction

  describe Core do

    context "with dirty dictionary" do
      let(:dictionary) { ["10th", "11th", "foo bar",
                          "Zoe",
                          "Zomba",
                          "zombie",
                          "zone",
                          "zoo",
                          "zoology" ] }
      let(:expected_sequences) { ["Zomb", "zomb", "zone", "zool"] }
      let(:expected_words) { ["Zomba", "zombie", "zone", "zoology"] }

      it "should return a data structure to use for the persistence" do
        extractor = Core.new(dictionary)
        extractor.result.size.should == expected_sequences.size
      end

      it "should match expected sequences" do
        extractor = Core.new(dictionary)
        extractor.result.each_with_index do |unique_sequence, index|
          unique_sequence.value.should == expected_sequences[index]
        end
      end

      it "should match expected words" do
        extractor = Core.new(dictionary)
        extractor.result.each_with_index do |unique_sequence, index|
          unique_sequence.word.should == expected_words[index]
        end
      end

    end
  end

end
