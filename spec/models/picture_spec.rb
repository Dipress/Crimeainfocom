# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  file           :string(255)
#  imageable_type :string(255)
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Picture, type: :model do
end
