require 'rubygems'
require 'open-uri'
require 'nokogiri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"



  page = Nokogiri::HTML(URI.open(PAGE_URL))  

  tbody=page.xpath("//tbody")
  td=page.xpath("//table//tbody//tr//td//div")
  print td

  # td_array=page.xpath("//table/tbody/tr[1]/td[3]/div").map(&:text)
  # puts td_array.inspect