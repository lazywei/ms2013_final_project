require 'nokogiri'
require 'typhoeus'

base_url = "http://www.inside.com.tw"
targets = []
(1..390).each do |page|
  r = Typhoeus::Request.get("#{base_url}/page/#{page}")
  doc = Nokogiri::HTML(r.body)
  doc.css('section#articles article').each do |article|
    targets << article.at_css('h2.entry-title a')['href']
  end
  if page % 10 == 0
    p "page:#{page} is done."
  end
end

data_dir = [File.dirname(__FILE__),'/data/www.inside.com.tw'].join

targets.each do |url|
  r = Typhoeus::Request.get(url)
  doc = Nokogiri::HTML(r.body)
  begin
    content = doc.at_css('div.content').content
    title = doc.at_css('h2.entry-title').content
    File.open("#{data_dir}/#{title}", 'w') { |file| file.write(content) }
    p "#{url} done."
  rescue
    p "#{url} has #{$!} errors."
  end
end
