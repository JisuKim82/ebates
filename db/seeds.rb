# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'rubygems'
# require 'nokogiri'
require 'open-uri'

Store.destroy_all

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
# File.open('stores-cashback.txt', 'w') do |file|
#   (0...stores.length).each do |idx| 
#     file.puts "#{stores[idx]} #{prices[idx]}"
#   end 
# end

(0...stores.length).each do |idx|
  Store.create!(name: stores[idx], cash_back: prices[idx])
end