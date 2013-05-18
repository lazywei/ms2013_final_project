require 'redis'

def n_gram(str)
  result = []
  (2..str.length).each do |word_length|
    (0..(str.length - word_length)).each do |index_of_start_word|
      result << str.slice(index_of_start_word, word_length)
    end
  end
  return result
end

redis = Redis.new

data_dir = [File.dirname(__FILE__),'/data'].join
data_files = Dir["#{data_dir}/*"]

result = []
data_files.each do |filename|
  next unless redis.get(filename).nil?

  text = File.read(filename)
  text = text.split(/[^\u4E00-\u9fa5]+/)
  text.each do |str|
    result << n_gram(str)
  end
  redis.set(filename, "done")
end

result.flatten!
result.each do |key|
  redis.incrby(key, 1)
end
