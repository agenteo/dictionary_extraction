module DictionaryExtraction

  class List
    attr_reader :dictionary

    def initialize(dictionary)
      @dictionary = dictionary
    end

    def unique_sequences
      result = []

      validator = Validator.new(dictionary)
      validator.valid_entries do |valid_dictionary_entry|
        sequence = valid_dictionary_entry[0..SEQUENCE_LENGTH_MATCH - 1]
        sequence_repetitions = dictionary.grep /^#{sequence}/
        if sequence_repetitions.size == 1
          result << UniqueSequence.new(sequence, valid_dictionary_entry)
        end
      end
      result
    end
  end

end
