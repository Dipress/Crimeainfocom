# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class Payment < ApplicationRecord
  include Slugable
  # Validations
  validates :title, :body, presence: true
end
