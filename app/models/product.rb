# == Schema Information
#
# Table name: products
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  product_type_id :bigint(8)        not null
#  price           :float            not null
#  likes           :integer          default(0)
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Product < ApplicationRecord
	acts_as_paranoid
	
  belongs_to :product_type
end
