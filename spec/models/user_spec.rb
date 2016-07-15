require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user){ create :user }

	it "validation" do
		 is_expected.to validate_presence_of(:first_name)
		 is_expected.to validate_presence_of(:last_name)
		 is_expected.to validate_presence_of(:email)
		 is_expected.to validate_uniqueness_of(:email)
	end
end