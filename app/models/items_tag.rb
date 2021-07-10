class ItemsTag
  include ActiveModel::Model
  attr_accessor :tags_name, :item_name, :price, :product_description,:category_id,
                :item_condition_id, :shipping_charge_id, :shipping_area_id,
                :estimated_time_id, :images, :user_id

  with_options presence: true do
    validates :images
    validates :item_name
    validates :product_description
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Please enter half-width' },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :estimated_time_id
      validates :item_condition_id
      validates :shipping_area_id
      validates :shipping_charge_id
    end
  end

  def save 
    item = Item.create(item_name: item_name, price: price, product_description: product_description, category_id: category_id, item_condition_id: item_condition_id, shipping_charge_id: shipping_charge_id, shipping_area_id: shipping_area_id, estimated_time_id: estimated_time_id, images: images, user_id: user_id)
    tag = Tag.where(tags_name: tags_name).first_or_initialize
    tag.save
    
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end