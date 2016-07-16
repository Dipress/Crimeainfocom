class StaticPage < ApplicationRecord
  include Tailable

  validates :body, :title, :slug, presence: true
end
