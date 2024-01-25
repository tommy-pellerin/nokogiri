require_relative '../lib/get_townhall'


describe "the crypto_scrapper function" do
  it "should return an Hash with at leat one key" do
    result = get_townhall_urls
    expect(result).to be_a(Hash)
    expect(result).not_to be_empty
  end
end