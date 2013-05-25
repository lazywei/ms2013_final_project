require 'nokogiri'
require 'typhoeus'

base_url = "http://tw.news.yahoo.com"
targets = []

(1..40).each do |page|
  r = Typhoeus::Request.get("#{base_url}/archive/#{page}.html")
  doc = Nokogiri::HTML(r.body)
  doc.css('ul.yom-list-wide li').each do |li|
    targets << li.at_css('a')['href']
  end
  p "page:#{page} is done."
end

data_dir = [File.dirname(__FILE__),'/data/tw.news.yahoo.com'].join

targets.each do |url|
  r = Typhoeus::Request.get(base_url + url)
  doc = Nokogiri::HTML(r.body)
  begin
    content = doc.at_css('div#mediaarticlebody').content
    File.open("#{data_dir}/#{url}", 'w') { |file| file.write(content) }
    p "#{base_url + url} done."
  rescue
    p "#{base_url + url} has #{$!} errors."
  end
end
