class OldLink < ApplicationRecord
  include Tailable

  belongs_to :static_page
end
