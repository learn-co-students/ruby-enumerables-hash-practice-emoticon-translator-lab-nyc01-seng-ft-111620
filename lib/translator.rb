require "yaml"

def load_library(file_path)
  empty_hash = {}
  emoticons = YAML.load_file("./lib/emoticons.yml")
    emoticons.each do |key, pairs|
      empty_hash_2 = {}
      empty_hash_2.store(:english, pairs[0])
      empty_hash_2.store(:japanese, pairs[1])
      empty_hash.store(key, empty_hash_2)
    end
  return empty_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, pairs|
    if emoticon == pairs[:english]
      return pairs[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, pairs|
    if emoticon == pairs[:japanese]
      return key
    end
  end
  return "Sorry, that emoticon was not found"  
end
