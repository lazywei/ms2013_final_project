require 'nokogiri'
require 'typhoeus'

base_url = "http://tw.news.yahoo.com"
targets = []

(1..5).each do |page|
  r = Typhoeus::Request.get("#{base_url}/most-popular/#{page}.html")
  doc = Nokogiri::HTML(r.body)
  doc.css('ul.most-popular-ul li').each do |li|
    targets << li.at_css('a')['href']
  end
end
targets.each do |url|
  r = Typhoeus::Request.get(base_url + url)
  doc = Nokogiri::HTML(r.body)
  content = doc.at_css('div#mediaarticlebody').content
  File.open("data/#{url}", 'w') { |file| file.write(content) }
end
