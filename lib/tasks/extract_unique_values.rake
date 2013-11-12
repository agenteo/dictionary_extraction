require_relative '../dictionary_extraction'

desc "Create two files with sequences and words"

namespace :dictionary_extraction do
  task :extract do
    File.delete('sequences.txt')
    File.delete('words.txt')

    contents = File.readlines("dictionary.txt")
    contents.map(&:chomp!) # removing new lines

    puts "# Processing dictionary.txt file..."
    core = DictionaryExtraction::Core.new(contents)
    unique_sequences = core.result

    puts "# Creating output..."
    unique_sequences.each do |unique_sequence|
      File.open("sequences.txt", 'a') do |file|
        file.puts unique_sequence.value
      end
      File.open("words.txt", 'a') do |file|
        file.puts unique_sequence.word
      end
    end
    puts "! Done"
    puts "Output inside sequences.txt and words.txt"

  end
end
