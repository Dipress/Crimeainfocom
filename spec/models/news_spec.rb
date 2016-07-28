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

require 'rails_helper'

RSpec.describe News, type: :model do
  let(:news){ create :news }
  
  it "validation" do
    %w(title description body).each do |field|
      is_expected.to validate_presence_of(field.to_sym)
    end
  end
end
