class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :product_name,        presence: true
  validates :product_description, presence: true
  validates :priced,              presence: true
  validates :image,               presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end

class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time

  validates :category, :product_condition, :shipping_fee, :prefecture, :shipping_time, numericality: { other_than: 1, message: "can't be blank" }

end
