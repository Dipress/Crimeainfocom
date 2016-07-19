require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  let(:user){ create :user }
  let(:service){ create :service }

  describe "GET #index" do
    it "return array of the service" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns service" do
      get :show, params: { id: service.id }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "create a service with admin role" do
      post :create,  params: { service: attributes_for(:service)}
      expect(Service.count).to eq(1)
    end

    it 'redirects to the "show" action for the new service' do
      post :create, params: { service: attributes_for(:service)}
      expect(response).to redirect_to Service.first
    end

    it 'does not create the service' do
      post :create, params: { service: attributes_for(:service, name: nil)}
      expect(Service.count).to eq(0)
    end

    it 're-renders the "new" view' do
      post :create, params: { service: attributes_for(:service, name: nil)}
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "located the requested service" do
      put :update, params: { id: service.id, service: attributes_for(:service, id: service.to_param)}
      expect(service).to eq(service) 
    end

    it "redirects to the updated service" do
      put :update, params: { id: service.id, service: attributes_for(:service, id: service.to_param, name: "Airmax 4G") }
      expect(response).to have_http_status(302)
    end

    it "check a changed the name attribute for service" do
      put :update, params: { id: service.id, service: attributes_for(:service, id: service.to_param, name: "Airmax 4G") }
      service.reload
      expect(service.name).to eq('Airmax 4G')
    end

    it "check for invalid name attribute for service" do
      put :update, params: { id: service.id, service: attributes_for(:service, id: service.to_param, name: '') }
      expect(service.name).to eq('MPLS')
    end

    it "re-renders the edit method" do
      put :update, params: { id: service.id, service: attributes_for(:service, id: service.to_param, name: '') }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "deletes the service" do
      delete :destroy, params: { id: service.id }
      expect(Service.count).to eq(0)
    end

    it "redirects to service#index" do
      delete :destroy, params: { id: service.id }
      expect(response).to have_http_status(302)
    end
  end

end
