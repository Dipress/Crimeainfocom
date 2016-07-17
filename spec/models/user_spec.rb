require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user){ create :user }

	it "validation" do
		%w(first_name last_name email).each do |field|
			is_expected.to validate_presence_of(field.to_sym)
		end
		is_expected.to validate_uniqueness_of(:email)
	end
end