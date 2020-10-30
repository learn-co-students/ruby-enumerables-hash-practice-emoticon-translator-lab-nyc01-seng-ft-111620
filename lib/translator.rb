# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  hash = {}
  file = YAML.load_file(file_path)

  file.each do |key, values|
    hash2 = {:english => values[0], :japanese => values[1]}
    hash.store(key, hash2)
  end
  # binding.pry
  return hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, values|
    if(emoticon) == values[:english]
      return values[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
#
def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  # code goes here
  emoticons.each do |key, values|
    if(emoticon) == values[:japanese]
      return key
    end
    # binding.pry
  end
  return "Sorry, that emoticon was not found"
end
