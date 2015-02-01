class Item < ActiveRecord::Base
  validates :url, presence: true
  validates :user_id, presence: true

  before_save :set_target_price

  belongs_to :user

  private

  def set_target_price
    return if target_price
    self.target_price = find_target_price
  end

  def find_target_price
    doc = Nokogiri::HTML(open(url))
    return unless price = doc.css("span#priceblock_ourprice").first.try(:text)
    price.gsub("$", "").to_f
  end
end
