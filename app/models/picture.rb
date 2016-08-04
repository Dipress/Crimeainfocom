# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  file           :string(255)
#  imageable_type :string(255)
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Picture < ApplicationRecord
  # Relations
  belongs_to :imageable, polymorphic: true

  # Carrierwave
  mount_uploader :file, ImageUploader

  # Validations
  validates :file, presence: true
end
