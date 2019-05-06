# == Schema Information
#
# Table name: price_products
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)        not null
#  price      :float            not null
#  price_date :datetime         not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PriceProduct < ApplicationRecord
	acts_as_paranoid

	before_create :set_price_date

  belongs_to :product

  def set_price_date
  	self.price_date = DateTime.now
  end
  
end
