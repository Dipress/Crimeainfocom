# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  body        :text(65535)
#  service_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord

  #Relations
  has_many :services
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  #Validations
  validates :name, :description, :body, presence: true
end
