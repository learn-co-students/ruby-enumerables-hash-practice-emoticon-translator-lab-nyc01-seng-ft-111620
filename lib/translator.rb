# require modules here
require "yaml"
require 'pry'
def load_library(file_path)
  
  emoticons = YAML.load_file(file_path)
  emoticons.each do |key, value|
    emoticons[key] = {:english => value[0], :japanese => value[1]}
    #'happy' => {:english = > :), :japanese => (^ v ^)}
  end
    
end
  

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  
  
  temp_string = "" #1st it = "sad"
  library.each do |key, value|
    if library[key][:japanese] == emoticon
      temp_string = key
      return temp_string
    end
  end 
  if temp_string == ""
   return "Sorry, that emoticon was not found"
  end
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  
  
  temp_string = ""
  lib.each do |key, value|
    if lib[key][:english] == emoticon
      temp_string = lib[key][:japanese]
      return temp_string
    end
  end
    if temp_string == ""
      return "Sorry, that emoticon was not found"
    end
end


