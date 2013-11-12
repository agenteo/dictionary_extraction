require 'spec_helper'

module DictionaryExtraction

  describe List do

    shared_examples_for "no sequences" do
      it "should be empty" do
        list = List.new(dictionary)
        list.unique_sequences.should be_empty
      end
    end
    
    describe "#unique_sequences" do
      context "with an empty dictionary" do
        let(:dictionary) { [] }
        it_behaves_like "no sequences"
      end

      context "with sequences too short" do
        let(:dictionary) { ['AAA', 'Zoo'] }

        it "should never receive such input" do
          # handled by Validator
        end
      end

      context "with no unique sequences" do
        let(:dictionary) { ['AAAS', 'AAAS'] }
        it_behaves_like "no sequences"
      end

      context "with one unique sequence" do
        context "with word same lenght as sequence" do
          let(:unique_sequence_word) { 'AAAS' }
          let(:dictionary) { [unique_sequence_word] }
      

          it "should return a UniqueSequence object" do
            list = List.new(dictionary)
            list.unique_sequences.first.should be_a(UniqueSequence)
          end

          it "should return the expected value" do
            list = List.new(dictionary)
            unique_sequence = list.unique_sequences.first
            unique_sequence.value.should == unique_sequence_word
          end

          it "should return the expected word" do
            list = List.new(dictionary)
            unique_sequence = list.unique_sequences.first
            unique_sequence.word.should == unique_sequence_word
          end
        end

        context "with one word longer then sequence" do
          let(:unique_sequence) { 'enri' }
          let(:unique_sequence_word) { "#{unique_sequence}a" }
          let(:dictionary) { [unique_sequence_word] }
      

          it "should return the expected value" do
            list = List.new(dictionary)
            result = list.unique_sequences.first
            result.value.should == unique_sequence
          end

          it "should return the expected word" do
            list = List.new(dictionary)
            result = list.unique_sequences.first
            result.word.should == unique_sequence_word
          end
        end

      end

      context "with two unique sequences" do
        context "with words same lenght as sequences" do
          let(:unique_sequence_word1) { 'AAAS' }
          let(:unique_sequence_word2) { 'abed' }
          let(:dictionary) { [unique_sequence_word1, unique_sequence_word2] }

          it "should return the expected value" do
            list = List.new(dictionary)
            unique_sequence1 = list.unique_sequences.first
            unique_sequence1.value.should == unique_sequence_word1
            unique_sequence2 = list.unique_sequences.last
            unique_sequence2.value.should == unique_sequence_word2
          end
        end
      end

      context "with two unique sequences and one not unique" do
        context "with words same lenght as sequences" do
          let(:unique_sequence_word1) { 'AAAS' }
          let(:unique_sequence_word2) { 'abed' }
          let(:duplicated_sequence) { 'abet' }
          let(:dictionary) { [unique_sequence_word1, unique_sequence_word2,
                              duplicated_sequence, duplicated_sequence] }

          it "should have two unique sequences" do
            list = List.new(dictionary)
            list.unique_sequences.size.should == 2
          end
        end

        context "with one word longer then sequence" do
          let(:unique_sequence_word1) { 'AAAS' }
          let(:unique_sequence2) { 'abed' }
          let(:unique_sequence_word2) { "#{unique_sequence2}moreCharacters" }
          let(:duplicated_sequence) { 'abet' }
          let(:dictionary) { [unique_sequence_word1, unique_sequence_word2,
                              duplicated_sequence, duplicated_sequence] }

          it "should have two unique sequences" do
            list = List.new(dictionary)
            list.unique_sequences.size.should == 2
          end

          it "should collect the second unique sequence" do
            list = List.new(dictionary)
            unique_sequence = list.unique_sequences.last
            unique_sequence.value.should == unique_sequence2
          end
        end
      end


    end
    
  end

end
