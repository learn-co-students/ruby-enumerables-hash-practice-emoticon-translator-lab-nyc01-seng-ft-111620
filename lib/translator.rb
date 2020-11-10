# require modules here
require "yaml"
require "pry"

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_lib = {}
  emoticons.each do |key, value|
    emoticon_lib[key] = {}
    emoticon_lib[key][:english] = value[0]
    emoticon_lib[key][:japanese] = value[1]
  end 
  emoticon_lib
end


def get_japanese_emoticon(path, english_emoticon)
  emoticon_lib = load_library(path)
  answer = emoticon_lib.keys.find do |key|  # .keys = iterate over .each key 
    if emoticon_lib[key][:english] == english_emoticon 
      emoticon_lib[key][:japanese]
    end
  end
  if answer 
    emoticon_lib[answer][:japanese]
  else 
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(path, japanese_emoticon)
  emoticon_lib = load_library(path)
  found = emoticon_lib.keys.find do |key| 
    innerHash = emoticon_lib[key][:japanese]
    if innerHash == japanese_emoticon
      key
    end
  end
  if found 
    found
  else
    "Sorry, that emoticon was not found" 
  end
  # binding.pry 
end





