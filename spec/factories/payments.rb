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

FactoryGirl.define do
  factory :payment do
    title "Some title payment"
    body "Text here"
    slug "some-title-payment"
  end
end
