class Item < ActiveRecord::Base
  validates :url, presence: true
  validates :user_id, presence: true

  before_create :set_target_price

  belongs_to :user

  def self.scrape_prices
    Item.find_each do |item|
      item.scrape_price
    end
  end

  def scrape_price
    current_price = find_price
    if current_price <  target_price
      ItemMailer.notify_price_below_target(self, current_price).deliver
    end
  end

  private

  def set_target_price
    return if target_price
    self.target_price = find_price
  end

  def find_price
    doc = Nokogiri::HTML(open(url))
    return unless price = doc.css("span#priceblock_ourprice").first.try(:text)
    price.gsub("$", "").to_f
  end
end
