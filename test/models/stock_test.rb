# == Schema Information
#
# Table name: stocks
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)        not null
#  quantity   :integer          not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
