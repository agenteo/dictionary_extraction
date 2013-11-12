module DictionaryExtraction

  class List
    attr_reader :dictionary

    def initialize(dictionary)
      @dictionary = dictionary
    end

    def unique_sequences
      result = []
      dictionary.each do |dictionary_entry|
        sequence = dictionary_entry[0..SEQUENCE_LENGTH_MATCH - 1]
        sequence_repetitions = dictionary.grep /^#{sequence}/
        if sequence_repetitions.size == 1
          result << UniqueSequence.new(sequence, dictionary_entry)
        end
      end
      result
    end
  end

end
