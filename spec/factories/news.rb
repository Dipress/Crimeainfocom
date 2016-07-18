# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  body        :text(65535)
#  main_page   :boolean          default(FALSE)
#  published   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :news do
    title "Some title news"
    description "This is important string"
    body "All text"
    main_page false
    published false
  end
end
