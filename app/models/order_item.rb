# == Schema Information
#
# Table name: order_items
#
#  id         :bigint(8)        not null, primary key
#  order_id   :bigint(8)        not null
#  product_id :bigint(8)        not null
#  quantity   :integer          not null
#  total      :float            default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#-=

class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :product

	before_create :set_total 
	before_update :set_total 

	def set_total
		self.total = self.quantity * self.product.get_price
	end

	def check_stock
		unless self.product.stock >= self.quantity 
			return false
		else
			return true
		end
	end

end
