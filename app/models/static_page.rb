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

class StaticPage < ApplicationRecord
  include Tailable

  validates :body, :title, :slug, presence: true
end
