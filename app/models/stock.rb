# == Schema Information
#
# Table name: stocks
#
#  id          :bigint(8)        not null, primary key
#  products_id :bigint(8)        not null
#  quantity    :integer          not null
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Stock < ApplicationRecord
  belongs_to :product
end
