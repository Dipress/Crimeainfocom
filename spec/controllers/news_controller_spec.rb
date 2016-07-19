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

  describe "PUT #update" do
    Devise::Test::ControllerHelpers
    
    before do
      sign_in(create(:user, :admin))
    end

    it "located the requested news" do
      put :update, params: { id: news.id, news: attributes_for(:news, id: news.to_param)}
      expect(news).to eq(news) 
    end

    it "redirects to the updated news" do
      put :update, params: { id: news.id, news: attributes_for(:news, id: news.to_param, title: "This is a update news") }
      expect(response).to have_http_status(302)
    end

    it "check a changed the title attribute for news" do
      put :update, params: { id: news.id, news: attributes_for(:news, id: news.to_param, title: "This is a update news") }
      news.reload
      expect(news.title).to eq('This is a update news')
    end

    it "check for invalid title attribute for news" do
      put :update, params: { id: news.id, news: attributes_for(:news, id: news.to_param, title: '') }
      expect(news.title).to eq('Some title news')
    end

    it "re-renders the edit method" do
      put :update, params: { id: news.id, news: attributes_for(:news, id: news.to_param, title: '') }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "deletes the news" do
      delete :destroy, params: { id: news.id }
      expect(News.count).to eq(0)
    end

    it "redirects to news#index" do
      delete :destroy, params: { id: news.id }
      expect(response).to have_http_status(302)
    end
  end
end