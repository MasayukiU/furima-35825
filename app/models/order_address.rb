class OrderAddress
	include ActiveModel::Model
	attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

	with_options presence: true do
		validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
		validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
		validates :city
		validates :house_number
		validates :phone_number
		validates :token
		# validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is invalid"}
	end

	def save
		order = Order.create(item_id: item_id, user_id: user_id)
		ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
	end
end