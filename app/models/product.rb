# == Schema Information
#
# Table name: products
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  product_type_id :bigint(8)        not null
#  likes           :integer          default(0)
#  deleted_at      :datetime
#  stock           :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Product < ApplicationRecord
	include PgSearch
	acts_as_paranoid

	pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true, any_word: true} }
	scope :available, -> {where('stock > 0')}

	belongs_to :product_type
	has_many :price_products
	has_many :like_products

	def get_price
		self.price_products.order("created_at DESC").first.price
	end
end
