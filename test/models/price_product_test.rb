# == Schema Information
#
# Table name: price_products
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)        not null
#  price      :float            not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PriceProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
