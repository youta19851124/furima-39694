class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :condition_genre
  belongs_to :shipping_fee_genre
  belongs_to :shipping_area_genre
  belongs_to :shipping_duration_genre

  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  validates :details, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_area_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_duration_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image
end
