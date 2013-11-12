module DictionaryExtraction

  class Core

    def initialize(dictionary)
      validator = Validator.new(dictionary)
      @valid_dictionary = validator.result
    end

    def result
      list = List.new(@valid_dictionary)
      list.unique_sequences
    end

  end

end
