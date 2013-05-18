require 'redis'

redis = Redis.new

text = '文字作品是通過文字、符號的組合來表達某種思想、感情的作品，包括了各種圖書、教科書、小說、劇本、詩歌、散文、論文、講演稿、書面報告等等。 文字作品和表現形式無關，因此手寫稿、打字稿等都屬於文字作品。但是並不是所有以文字形式表達的作品都是文字作品，例如書法作品，雖然形式上也是文字，但是'

text = text.split(/[^\u4E00-\u9fa5]+/)

def n_gram(str)
  result = []
  (2..str.length).each do |word_length|
    (0..(str.length - word_length)).each do |index_of_start_word|
      result << str.slice(index_of_start_word, word_length)
    end
  end
  return result
end

result = []
text.each do |str|
  result << n_gram(str)
end
result.flatten!
result.each do |key|
  redis.incrby(key, 1)
end
