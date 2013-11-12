module DictionaryExtraction
  class UniqueSequence
    attr_reader :value, :word

    def initialize(value, word)
      @value, @word = value, word
    end
  end
end
