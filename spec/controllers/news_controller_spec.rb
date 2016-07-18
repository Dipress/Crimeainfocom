require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  let(:user){ create :user }
  let(:news){ create :news }

  describe "GET #index" do
    it "return array of the news" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns news" do
      get :show, params: { id: news.id }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "create a news with admin role" do
      post :create,  params: { news: attributes_for(:news)}
      expect(News.count).to eq(1)
    end

    it 'redirects to the "show" action for the new news' do
      post :create, params: { news: attributes_for(:news)}
      expect(response).to redirect_to News.first
    end

    it 'does not create the news' do
      post :create, params: { news: attributes_for(:news, title: nil)}
      expect(News.count).to eq(0)
    end

    it 're-renders the "new" view' do
      post :create, params: { news: attributes_for(:news, title: nil)}
      expect(response).to render_template(:new)
    end
  end
end
