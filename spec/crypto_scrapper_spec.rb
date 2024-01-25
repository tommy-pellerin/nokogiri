require_relative '../lib/crypto_scrapper'


describe "the crypto_scrapper function" do
  it "should return an Hash with at leat one key" do
    result = crypto_scrapper
    expect(result).to be_a(Hash)
    expect(result).not_to be_empty
  end
end