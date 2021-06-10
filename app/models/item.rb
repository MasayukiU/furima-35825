class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :estimated_time
	belongs_to :item_condition
  belongs_to :shipping_area
  belongs_to :shipping_charge

	has_one_attached :image

	belongs_to :user
	# has_one :purchase_history

	with_options presence: true do
		validates :image
		validates :item_name
		validates :product_description
		validates :price, format: { with: /\A[0-9]+\z/, message: 'Please enter half-width' },
											numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
		
		with_options numericality: { other_than: 0 } do	
			validates :category_id
			validates :estimated_time_id
			validates :item_condition_id
			validates :shipping_area_id
			validates :shipping_charge_id
		end
	end
end
