# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  middle_name            :string(255)
#  last_name              :string(255)
#

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
