require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.ebates.com/stores/all/index.htm"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text

stores = []
doc.css("#moreStoresTable .storeName").each do |item|
  stores << item.at_css("a").text
end

prices = []
doc.css("#moreStoresTable .storeRebate").each do |item|
  prices << item.at_css("a").text
end
