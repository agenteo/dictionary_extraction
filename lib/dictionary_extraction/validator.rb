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
        @dictionary.grep /^[a-zA-Z]+$/
      end
  end

end
