# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  users_id   :bigint(8)        not null
#  order_date :datetime         not null
#  total      :float            not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
end
