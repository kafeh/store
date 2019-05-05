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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
