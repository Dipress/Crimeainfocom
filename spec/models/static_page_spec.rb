require 'rails_helper'

RSpec.describe StaticPage, type: :model do
  it 'validations' do
    %w(body title slug).each do |field|
      is_expected.to validate_presence_of(field.to_sym)
    end
  end
end
