# require modules here
require 'pry'

def load_library(file_path)
  # code goes here
  require "yaml"
  emoticons = YAML.load_file('./lib/emoticons.yml')
 emoticons.map do |key, values_array|
   [key, {
  :english => values_array[0],
  :japanese => values_array[1]
  }]
  end.to_h
  
end

def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each do |emotion, values_hash|
    if english_emoticon == values_hash[:english]
      return values_hash[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each do |emotion, values_hash|
    if japanese_emoticon == values_hash[:japanese]
      return emotion
    end
  end
  "Sorry, that emoticon was not found"
end