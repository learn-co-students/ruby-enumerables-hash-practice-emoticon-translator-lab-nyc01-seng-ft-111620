# require modules here
require 'pry'
require "yaml"

emoticons = YAML.load_file('lib/emoticons.yml')


def load_library(path)
  # code goes here
  emo = {}
  YAML.load_file(path).each do |key,value|
    emo[key] = {:english => value[0], :japanese => value[1]}
  end
  emo
end


def get_japanese_emoticon(path, emoticon)
  # code goes here
load_library(path).each do |key, value|
   if value[:english] == emoticon
     return value[:japanese]
   end
 end

  return  "Sorry, that emoticon was not found"
  end
  
def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path).each do |key, value|
   if value[:japanese] == emoticon
     return key
   end
 end

  return  "Sorry, that emoticon was not found"
  end
  