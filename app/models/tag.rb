class Tag < ApplicationRecord
	has_many :item_tag_relations
  has_many :items, through: :item_tag_relations

  validates :tags_name, uniqueness: true
end
