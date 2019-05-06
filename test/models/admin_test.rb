# == Schema Information
#
# Table name: admins
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
