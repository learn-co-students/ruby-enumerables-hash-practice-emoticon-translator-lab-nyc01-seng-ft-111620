# require modules here
require "yaml"
require "pry"
path = YAML.load_file('./lib/emoticons.yml')

def load_library(path)
# load YAML file and save to variable
  emoticon_symbols = YAML.load_file(path)
# initialize result_library hash to eventually be returned
  result_library = {}
    #binding.pry
# iterate over emoticon_symbols file using word as key and emoji_pair for its values
  emoticon_symbols.each do |word, emoji_pair|
# initialize empty nested hash inside result_library
    result_library[word] = {}
     #binding.pry
# place 0th element in emoji_pair to result_library[word], giving it an :english key  
    result_library[word][:english] = emoji_pair[0]
# place 1st element in emoji_pair to result_library[word], giving it a :japanese key
    result_library[word][:japanese] = emoji_pair[1]
    #binding.pry
  end
# return completed library hash
  return result_library
end



def get_japanese_emoticon(path, emoticon)
  result_library = load_library(path)
  
    result_library.keys.find do |key|
      #binding.pry
      if result_library[key][:english] == emoticon
        return result_library[key][:japanese]
      end
    end
    return 'Sorry, that emoticon was not found'
end

 

def get_english_meaning(path, emoticon)
  result_library = load_library(path)
    result_library.each do |key, value|
      if value[:japanese] == emoticon
        return key
      end
    end
  return "Sorry, that emoticon was not found"
end