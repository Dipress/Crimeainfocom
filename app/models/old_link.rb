# == Schema Information
#
# Table name: old_links
#
#  id             :integer          not null, primary key
#  slug           :string(255)
#  static_page_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class OldLink < ApplicationRecord
  include Tailable

  belongs_to :static_page
end
