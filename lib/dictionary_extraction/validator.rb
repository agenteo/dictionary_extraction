module DictionaryExtraction

  class Validator

    def initialize(dictionary)
      @dictionary = dictionary
    end

    def result
      letters_only_dictionary
    end

    private

      def letters_only_dictionary
        @dictionary.grep /^[a-zA-Z]{#{SEQUENCE_LENGTH_MATCH},}/
      end
  end

end
