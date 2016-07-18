# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :static_page do
    body 'MyText'
    title 'MyString'
    slug 'MyString'

    trait :existing do
      slug 'existing_page/any'
    end
  end
end
