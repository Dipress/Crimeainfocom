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
