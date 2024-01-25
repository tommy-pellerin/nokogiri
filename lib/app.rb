require 'rubygems'
require 'open-uri'
require 'nokogiri'

PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
  
page = Nokogiri::HTML(URI.open(PAGE_URL))   
# puts page.css('title')
# puts page.css('li')
# puts page.css('li')[0].text
# puts page.css('li')[1]['href'] #n'affiche rien ?
# puts page.css("li[data-category='news']") #n'affiche rien ?
# puts page.css('div#funstuff')[0]
# puts page.css('div#reference a') #n'affiche rien ?

# puts page.css("title")[0].name   # => title
# puts page.css("title")[0].text   # => My webpage

# links = page.css("a")
# puts links.length   # => 6
# puts links[0].text   # => Click here
# puts links[0]["href"] # => http://www.google.com

# news_links = page.css("a").select{|link| link['data-category'] == "news"}
# news_links.each{|link| puts link['href'] }

# #=>   http://reddit.com
# #=>   http://www.nytimes.com
         
# puts news_links.class   #=>   Array

# news_links = page.css("a[data-category=news]")
# news_links.each{|link| puts link['href']}
# #=>   http://reddit.com
# #=>   http://www.nytimes.com

# puts news_links.class   #=>   Nokogiri::XML::NodeSet 
# puts page.css('p').css("a[data-category=news]").css("strong") #fonctionne pas

# comprendre le Xpath

	doc = Nokogiri::HTML(open('http://www.google.com/search?q=doughnuts'))
	doc.xpath('//h3/a').each do |node|
	  puts node.text
	end
