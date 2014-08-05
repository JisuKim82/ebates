require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.ebates.com/stores/all/index.htm"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text

stores = []
doc.css("#moreStoresTable .storeName").each do |item|
  stores << item.at_css("a").text.gsub!(/\s\s+/,' ')
end

prices = []
doc.css("#moreStoresTable .storeRebate").each do |item|
  prices << item.at_css("a").text
end

#write information to 'stores-cashback.txt'
File.open('stores-cashback.txt', 'w') do |file|
  (0...stores.length).each do |idx| 
    file.puts "#{stores[idx]} #{prices[idx]}"
  end 
end