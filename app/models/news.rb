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
#  slug        :string(255)
#

class News < ApplicationRecord
  include Slugable
  
  # Relations
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  # Validations
  validates :title, :description, :body, presence: true
end
