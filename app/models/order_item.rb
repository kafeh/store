# == Schema Information
#
# Table name: order_items
#
#  id          :bigint(8)        not null, primary key
#  order_id    :bigint(8)        not null
#  products_id :bigint(8)        not null
#  quantity    :integer          not null
#  total       :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :order
end
