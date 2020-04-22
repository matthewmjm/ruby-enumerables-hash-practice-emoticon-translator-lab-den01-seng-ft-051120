# require modules here
require "yaml"
require "pry"

def load_library(ymlpath)
  emoticons = YAML.load_file(ymlpath)
  update_emoticons = {}
    emoticons.each do |meaning, emo_set|
      if update_emoticons[meaning] == nil
        update_emoticons[meaning] = {}
        update_emoticons[meaning]["english".to_sym] = emo_set.first
        update_emoticons[meaning]["japanese".to_sym] = emo_set.last
      else
        update_emoticons[meaning]["english".to_sym] = emo_set.first
        update_emoticons[meaning]["japanese".to_sym] = emo_set.last
      end
    end
  update_emoticons
end




def get_japanese_emoticon(path, emoticon)
  eng_translate = load_library(path)
  result = nil
  eng_meaning = {}
    eng_translate.each { |mean, value| eng_meaning[mean] = eng_translate[mean][:japanese] }
  eng_meaning.each do | kmean, vemo |
    if vemo == emoticon
      result = kmean
    end
  end
    if result == nil
      "Sorry, that emoticon was not found"
    else
      result
    end
end


def get_english_meaning(path, emoticon)
  eng_translate = load_library(path)
  result = nil
  eng_meaning = {}
    eng_translate.each { |mean, value| eng_meaning[mean] = eng_translate[mean][:japanese] }
  eng_meaning.each do | kmean, vemo |
    if vemo == emoticon
      result = kmean
    end
  end
    if result == nil
      "Sorry, that emoticon was not found"
    else
      result
    end
end

