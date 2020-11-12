require 'yaml'
require 'pry'
def load_library(file_path)
  emoticons_hash = YAML.load_file(file_path)
  #puts emoticons_hash.inspect
  hash = {}
  array = []
    emoticons_hash.each() do |key, value|
      hash[key] = {}
      hash[key][:english] = value[0]
      hash[key][:japanese] = value[1]
    end 
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash_translations = load_library(file_path)
  hash_translations.keys.find do |key| 
    if hash_translations[key][:english] == emoticon
      return hash_translations[key][:japanese]
     end 
  end 
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  hash_translations = load_library(file_path)
  hash_translations.keys.find do |key| 
    if hash_translations[key][:japanese] == emoticon
      return key
    end 
  end 
  return "Sorry, that emoticon was not found"
end