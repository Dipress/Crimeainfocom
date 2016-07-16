require 'rails_helper'

RSpec.describe StaticPagesController, type: :request do
  describe 'GET /*tail' do
    it 'returns http success' do
      get '/partnership.html'
      expect(response).to have_http_status(:not_found)
    end
  end


  context 'With existing page' do
    let(:page) { create :static_page, :existing }

    describe 'GET /*tail' do
      it 'returns http success' do
        get "/#{page.slug}"
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'With old link' do
    let(:page) { create :static_page, :existing }
    let(:old_link) { create :old_link, slug: 'partnership.html', static_page: page }

    describe 'GET /*tail' do
      it 'returns http success' do
        get "/#{old_link.slug}"
        expect(response).to have_http_status(301)
      end
    end
  end
end
