require 'nokogiri'
require 'typhoeus'

targets = []

r = Typhoeus::Request.get("http://www.360doc.com/content/10/0810/01/0_44895937.shtml")
doc = Nokogiri::HTML(r.body)
doc.css('span#articlecontent a').slice(9..-1).each do |a|
  targets << a['href']
  p "page:#{a['href']} is done."
end

data_dir = [File.dirname(__FILE__),'/data/www.dpes.tc.edu.tw'].join

targets.each do |url|
  r = Typhoeus::Request.get(url)
  doc = Nokogiri::HTML(r.body)
  begin
    content = doc.at_css('font').content
    File.open("#{data_dir}/#{url.split('/').last}", 'w') { |file| file.write(content) }
    p "#{url} done."
  rescue
    p "#{url} has #{$!} errors."
  end
end
