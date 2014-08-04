require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.ebates.com/stores/all/index.htm"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text

doc.css("#moreStoresTable .storeName").each do |item|
  puts item.at_css("a").text
end