require 'yaml'
require 'pry'
# require modules here

def load_library(emoticon)
  emoticons = YAML.load_file(emoticon)
  emoticon_lib = {}
  emoticons.each do |key, value|
    emoticon_lib[key] = {}
    emoticon_lib[key][:english] = value[0]
    emoticon_lib[key][:japanese] = value[1]
    # binding.pry
  end
  emoticon_lib
  # binding.pry
end

def get_japanese_emoticon(emoticon_file, emoticon)
  library = load_library(emoticon_file)
  library.values
  # binding.pry
end

def get_english_meaning(emoticon, emote)
  
  
end