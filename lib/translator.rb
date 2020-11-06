# require modules here
require 'pry'
require 'yaml'
def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
final_hash = {}
  emoticons.each do |key,value|
   # binding.pry
    final_hash[key] = {:english => value[0], :japanese => value[1]}
    #binding.pry
    end
   # emoticons.each do |key|
     # ke
      #final_results[key]
    #  if key
  #  binding.pry
    # assing a value of :english to each key [0], [1]
    
  #english_emoji  = {}
   # emoticons.each do |name, emoji|
     # english_emoji[name][] = 
      
    final_hash
 
end

def get_japanese_emoticon(file_path,emoticon)
  # code goes here
  #binding.pry
  temp_string = ""
  library = load_library(file_path)
#  binding.pry
    library.each do |key,value|
        if emoticon == value[:english]
          temp_string = value[:english]
          return value[:japanese]
        end
    end
          if temp_string == "" 
          return "Sorry, that emoticon was not found"
            end
end

def get_english_meaning(file_path,emoticon)
  # code goes here
  library =load_library(file_path)
  #binding.pry
  empty_string= ""
  library.each do |key,value|
    #binding.pry
    if value[:japanese] == emoticon
     #binding.pry
     empty_string = key
    #binding.pry
    return empty_string
        end
  end
      if empty_string == "" 
          return "Sorry, that emoticon was not found"
            end
end