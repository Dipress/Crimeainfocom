# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  resource_type :string(255)
#  resource_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

FactoryGirl.define do
  factory :role do
    trait :admin do
      name 'admin'
    end
  end
end
