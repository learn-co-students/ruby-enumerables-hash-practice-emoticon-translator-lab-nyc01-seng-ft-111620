# require modules here
require "yaml"
YAML.load_file('./lib/emoticons.yml')

require 'pry'

def load_library(path)
  path = YAML.load_file('./lib/emoticons.yml')
  path.each do |name, emote|
    path[name] = {}
    path[name][:english] = emote[0]
    path[name][:japanese] = emote[1]
  end
end


def get_english_meaning(path, emote)
  sorry_message = "Sorry, that emoticon was not found"
  
  emote_hash = load_library(path)
  emote_hash.each do |emote_name, e|
    if e[:japanese] == emote
    return emote_name
    end
  end
  sorry_message
end

def get_japanese_emoticon(path, emote)
  sorry_message = "Sorry, that emoticon was not found"
  
  emote_hash = load_library(path)
  emote_hash.each do |emote_name, e|
    if e[:english] == emote
      return e[:japanese]
    end
  end
  sorry_message
end

