module DictionaryExtraction

  class Core

    def initialize(dictionary)
      @dictionary = dictionary
    end

    def result
      list = List.new(@dictionary)
      list.unique_sequences
    end

  end

end
