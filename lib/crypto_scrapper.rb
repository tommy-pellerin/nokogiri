require 'rubygems'
require 'open-uri'
require 'nokogiri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
  
page = Nokogiri::HTML(URI.open(PAGE_URL))  


tbody = page.xpath("//tbody")
tr= tbody.xpath("//tr")
td_column3 = page.xpath('//tbody/tr/td[3]')
# puts td_column3
# div_td= td_column3.xpath("//div[1]") #résultat insatisfait

# name1 = tr.css("td")[2].text
# name2 = tr.css("td")[2].text
# print tr
# puts name1

#récupération de nom de crypto
cryptoS_array = []
td_column3.each do |element|
  cryptoS_array << element.text
  # puts element
end
# puts cryptoS_array.inspect

filtre_crypto_array = cryptoS_array.select{ |element| element!= ""}
# puts filtre_crypto_array.inspect


#récupération du prix
td_column5 = page.xpath('//tbody/tr/td[5]')
# puts td_column5
price_array = []
td_column5.each do |element|
  price_array << element.text
  # puts element
end
# puts price_array.inspect
#transforme et float
good_price_array = price_array.map{|element| element.tr("$,","").to_f}

#creation de Hash
crypto_hash = Hash[filtre_crypto_array.zip(good_price_array)]
puts crypto_hash.inspect