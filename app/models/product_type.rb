# == Schema Information
#
# Table name: product_types
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductType < ApplicationRecord
	acts_as_paranoid 

	has_many :products
end
