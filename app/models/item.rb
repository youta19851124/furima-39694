class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre, class_name: 'CategoryGenre', foreign_key: :category_id
  belongs_to :condition_genre, class_name: 'ConditionGenre', foreign_key: :condition_id
  belongs_to :shipping_fee_genre, class_name: 'ShippingFeeGenre', foreign_key: :shipping_fee_id
  belongs_to :shipping_area_genre, class_name: 'ShippingAreaGenre', foreign_key: :shipping_area_id
  belongs_to :shipping_duration_genre, class_name: 'ShippingDurationGenre', foreign_key: :shipping_duration_id

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
  has_one :order
end
