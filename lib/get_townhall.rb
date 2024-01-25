require 'rubygems'
require 'open-uri'
require 'nokogiri'

# page_town_url = "https://www.annuaire-des-mairies.com/95/breancon.html"
ANNUAIRE_VALDOISE = "https://www.annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_email(page_town_url)
  page = Nokogiri::HTML(URI.open(page_town_url))

  td_array = page.xpath("//tbody[1]//tr[4]//td[2]").map(&:text)
  email = td_array[0]

  # print email
  return email
end


def get_townhall_urls
  page = Nokogiri::HTML(URI.open(ANNUAIRE_VALDOISE))
  all_emails_links = page.xpath('//table[@class="Style20"]/tr/td/p/a')
  # puts all_emails_links
  all_email_href = []
  all_emails_links.each do |email_link|
    all_email_href << "https://www.annuaire-des-mairies.com/" + email_link['href']
    # puts  email_link['href']
  end
  # puts all_email_href  
  
  
  email_array = []
  # all_email_href = ["https://www.annuaire-des-mairies.com/95/breancon.html"]
  all_email_href.each do |page_town_url|
    # puts page_town_url
    email_array << get_townhall_email(page_town_url)
  end
  # puts email_array
  #recupérere les noms
  email_link_name = []
  all_emails_links.each do |email_link|
    email_link_name << email_link.text
    
  end
  # puts email_link_name
  
  #creer un hash
  town_hash = Hash[email_link_name.zip(email_array)]
  

  return town_hash
end

get_townhall_urls




  
