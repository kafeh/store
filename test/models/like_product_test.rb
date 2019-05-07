# == Schema Information
#
# Table name: like_products
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)        not null
#  user_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LikeProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
