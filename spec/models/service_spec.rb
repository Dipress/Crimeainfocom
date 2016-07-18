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

require 'rails_helper'

RSpec.describe Service, type: :model do
	let(:service){ create :service } 
	
	it "validation" do
		%w(name description body).each do |field|
			is_expected.to validate_presence_of(field.to_sym)
		end
	end
	it "relations" do
		is_expected.to have_many :services
	end
end
