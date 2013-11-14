module DictionaryExtraction

  class Validator

    def initialize(dictionary)
      @dictionary = dictionary
    end

    def valid_entries(&block)
      @dictionary.each do |dictionary_entry|
        if letters_only_entry?(dictionary_entry)
          yield dictionary_entry
        end
      end
    end

    private

      def letters_only_entry?(entry)
        entry =~ /^[a-zA-Z]{#{SEQUENCE_LENGTH_MATCH},}/
      end
  end

end
