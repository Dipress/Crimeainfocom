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
	has_many :services

	validates :name, :description, :body, presence: true
end
