class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :estimated_time
  belongs_to :item_condition
  belongs_to :shipping_area
  belongs_to :shipping_charge
  
  has_many_attached :images
  belongs_to :user
  has_one :order

  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
end
