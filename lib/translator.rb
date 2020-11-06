# require modules here
require "yaml"
require "pry"

# def load_library(path)
#   emoticon_symbols = YAML.load_file(path)
#   result_library = {}
#   emoticon_symbols.each do |word, emoji_pair|
#     result_library[word] = {}
#     # place 0th element in emoji_pair to result_library[word], giving it an :english key  
#     result_library[word][:english] = emoji_pair[0]
#     # place 1st element in emoji_pair to result_library[word], giving it a :japanese key
#     result_library[word][:japanese] = emoji_pair[1]
#   end
#   result_library
# end



# def get_japanese_emoticon(path, emoticon)
#   result_library = load_library(path)
#     result_library.keys.detect do |key|
#       if result_library[key][:english] == emoticon
#         return result_library[key][:japanese]
#       end
#     end
#   return 'Sorry, that emoticon was not found'
# end


 

# # def get_english_meaning(path, emoticon)
# #   result_library = load_library(path)
# #     result_library.each do |word, emoji_pair|
# #       if emoji_pair[:japanese] == emoticon
# #         return word
# #       end
# #     end
# #   return "Sorry, that emoticon was not found"
# # end




# def get_english_meaning(path, emoticon)
#   result_library = load_library(path)
#   result_library.each do |word, emoji_pair|
#     if emoji_pair[:japanese] == emoticon
#       return word
#     end
#   end
#   return "Sorry, that emoticon was not found"
# end
# puts get_english_meaning('./lib/emoticons.yml', "jacob")



path = YAML.load_file('./lib/emoticons.yml')






def load_library(path)
  emoticon_symbols = YAML.load_file(path)
  result = {}
  emoticon_symbols.each do |word, symbol_pair|
    result[word] = {}
    result[word][:english] = symbol_pair[0]
    result[word][:japanese] = symbol_pair[1]
  end
  result
end



def get_english_meaning(path, emoticon)
  result = load_library(path)
  result.each do |word, symbol_pair|
    symbol_pair.each do |key, value|
        if value == emoticon
          return word
        end
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(path, emoticon)
  result = load_library(path)
    result.each do |word, symbol_pair|
      if result[word][:english] == emoticon
        return result[word][:japanese]
      end
    end
  return "Sorry, that emoticon was not found"
end
























