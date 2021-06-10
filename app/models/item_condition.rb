class ItemCondition < ActiveHash::Base
	self.data = [
		{ id: 0, name: '--' },
		{ id: 1, name: '新品・未使用' },
		{ id: 2, name: '未使用に近い' },
		{ id: 3, name: '目立った傷や汚れなし' },
		{ id: 4, name: 'やや傷や汚れあり' },
		{ id: 5, name: '傷や汚れあり' },
		{ id: 6, name: '全体的に状態が悪い' },
		{ id: 7, name: '家電・スマホ・カメラ' },
		{ id: 8, name: 'スポーツ・レジャー' },
		{ id: 9, name: 'ハンドメイド' },
		{ id: 10, name: 'その他' }
	]

	include ActiveHash::Associations
  has_many :item
end
