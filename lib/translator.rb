require "yaml"
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticon_hash = Hash.new
  emoticons.each do |english_word, emoticon_set|
    emoticon_hash[english_word] = {:english => emoticon_set[0], :japanese => emoticon_set[1]}
  end
  emoticon_hash
end

def get_japanese_emoticon(file, english_emoticon)
  hash_library = load_library(file)
  result = nil
  sorry_message = "Sorry, that emoticon was not found"
  hash_library.each do |meaning, languages|
    if languages[:english] == english_emoticon
      result = languages[:japanese]
    end
  end
  if result
    result
  else
    sorry_message
  end
end

def get_english_meaning(file, japanese_emoticon)
  hash_library = load_library(file)
  result = nil
  sorry_message = "Sorry, that emoticon was not found"
  hash_library.each do |meaning, languages|
    if languages[:japanese] == japanese_emoticon
        result = meaning
    end
  end
  if result
    result
  else
    sorry_message
  end
end




