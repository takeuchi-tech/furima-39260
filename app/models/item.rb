class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :product_name,         presence: true, length: { maximum: 40 }
  validates :product_description,  presence: true, length: { maximum: 1000 }
  validates :category_id,          presence: true
  validates :product_condition_id, presence: true
  validates :shipping_fee_id,      presence: true
  validates :prefecture_id,        presence: true
  validates :shipping_time_id,     presence: true
  validates :priced,               presence: true
  validates :image,                presence: true, unless: :was_attached?

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

  validates :category_id, :product_condition_id, :shipping_fee_id, :prefecture_id, :shipping_time_id, numericality: { other_than: 1, message: "can't be blank" }

end
