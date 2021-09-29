class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :filename

  with_options presence: true do
    validates :name
    validates :description
    validates :filename
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_cost, :prefecture, :shipping_day

  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 0, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
