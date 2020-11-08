# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  # code goes here
  my_hash = {"emotion" => {:english => {}, :japanese => {}}}
  library = YAML.load_file("./lib/emoticons.yml")

  library.each do |emotion, array|

    my_hash[emotion] = {:english => array[0], :japanese => array[1]}
  end 
my_hash   
end

def get_japanese_emoticon (file, emoticon)
  # code goes here
  weeb = load_library(file)
  
  weeb.each do |meaning, emoji|
    if emoji[:english] == emoticon 
      return emoji[:japanese]
    end 
  end 
  "Sorry, that emoticon was not found"
end



def get_english_meaning(file, emotion)
  # code goes here
  suffering = load_library(file)
  
  suffering.each do |meaning, emoji|
    if emoji[:japanese] == emotion  
      return meaning 
    
    end 
    
  end 
"Sorry, that emoticon was not found"    
  
end