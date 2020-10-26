# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  emojis = YAML.load_file(file_path)
  emoji = {}
  emojis.each do |emotion, value|
    if emoji[emotion] == NIL
      emoji[emotion] = {:english => value[0], :japanese => value[1]}
    end
  end  
  emoji        
end

def get_japanese_emoticon(file,emoticon)
  # code goes here
  emojis = load_library(file)
  message = "Sorry, that emoticon was not found"
  emojis.each do |emotion, values|
    if emojis[emotion].has_value? emoticon
      return emojis[emotion][:japanese]
    end
  end
  message
end

def get_english_meaning(file, emoticon)
  # code goes here
  emojis = load_library(file)
  message = "Sorry, that emoticon was not found"
  emojis.each do |emotion, values|
    if emojis[emotion].has_value? emoticon
      return emotion
    end
  end  
  message
end