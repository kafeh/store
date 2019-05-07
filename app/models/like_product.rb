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

class LikeProduct < ApplicationRecord
  belongs_to :product, counter_cache: :likes
  belongs_to :user

  validates :product_id, uniqueness: { scope:  :user_id, message: "User can only like a product once" } 
end
