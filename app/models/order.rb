# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  total      :float            default(0.0), not null
#  deleted_at :datetime
#  status     :integer          default("active"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
	acts_as_paranoid

	belongs_to :user
	has_many :order_items

	before_create :check_active_orders

	enum status: [:active, :finished]

	def check_active_orders
		self.user.orders.active.each do |order|
			order.really_destroy!
		end
	end

	def set_total
		self.total = self.order_items.sum(:total)
		self.save
	end

	def update_stock
		self.order_items.each do |item|
			if item.check_stock
				item.product.stock -= item.quantity  
				item.product.save
			else
				item.destroy
			end
		end
	end

end
