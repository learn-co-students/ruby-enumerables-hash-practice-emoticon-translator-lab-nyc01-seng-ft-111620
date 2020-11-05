# require modules here
require 'yaml'




def load_library(file)
  hash_library = {}
  the_hash = YAML.load_file(file)
  the_hash.each do |key,array|
    hash_library[key] = {:english => array[0], :japanese => array[1]}
  end
  hash_library
end

def get_japanese_emoticon(file,e_emoticon)
  final_emoticon = nil
  load_library(file).each do |name_key, emoticon_hash|
    emoticon_hash.each do |language,emoji|
      if emoji == e_emoticon
        emoticon_hash.each do |lang, emoj|
          if lang == :japanese
            final_emoticon = emoj
          end
        end
      end
    end
    
end
if final_emoticon == nil
  final_emoticon = "Sorry, that emoticon was not found"
end
final_emoticon
end

def get_english_meaning(file,emoticon)
  return_value = nil
  load_library(file).each do
    |name_key,emoticon_hash|
    emoticon_hash.each do |language, emoji|
      if emoji == emoticon
        return_value = name_key
      end
      
        
    end
  end
if return_value == nil
  return_value = "Sorry, that emoticon was not found"
end
  return_value
end

