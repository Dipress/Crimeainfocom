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

require 'rails_helper'

RSpec.describe StaticPage, type: :model do
  it 'validations' do
    %w(body title slug).each do |field|
      is_expected.to validate_presence_of(field.to_sym)
    end
  end
end
