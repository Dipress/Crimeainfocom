require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:user){ create :user }
  let(:payment){ create :payment }

  describe "GET #index" do
    it "return array of the payments" do
      get :index
      expect(response).to be_success
    end
  end
  describe "GET #show" do
    it "returns payment" do
      get :show, params: { id: payment.id }
      expect(response).to be_success
    end
  end
  describe "POST #create" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "create a payment with admin role" do
      post :create,  params: { payment: attributes_for(:payment)}
      expect(Payment.count).to eq(1)
    end

    it 'redirects to the "show" action for the new payment' do
      post :create, params: { payment: attributes_for(:payment)}
      expect(response).to redirect_to Payment.first
    end

    it 'does not create the payment' do
      post :create, params: { payment: attributes_for(:payment, title: nil)}
      expect(Payment.count).to eq(0)
    end

    it 're-renders the "new" view' do
      post :create, params: { payment: attributes_for(:payment, title: nil)}
      expect(response).to render_template(:new)
    end
  end
  describe "PUT #update" do
    Devise::Test::ControllerHelpers
    
    before do
      sign_in(create(:user, :admin))
    end

    it "located the requested payment" do
      put :update, params: { id: payment.id, payment: attributes_for(:payment, id: payment.to_param)}
      expect(payment).to eq(payment) 
    end

    it "redirects to the updated payment" do
      put :update, params: { id: payment.id, payment: attributes_for(:payment, id: payment.to_param, title: "This is a update payment") }
      expect(response).to have_http_status(302)
    end

    it "check a changed the title attribute for payment" do
      put :update, params: { id: payment.id, payment: attributes_for(:payment, id: payment.to_param, title: "This is a update payment") }
      payment.reload
      expect(payment.title).to eq('This is a update payment')
    end

    it "check for invalid title attribute for payment" do
      put :update, params: { id: payment.id, payment: attributes_for(:payment, id: payment.to_param, title: '') }
      expect(payment.title).to eq('Some title payment')
    end

    it "re-renders the edit method" do
      put :update, params: { id: payment.id, payment: attributes_for(:payment, id: payment.to_param, title: '') }
      expect(response).to render_template(:edit)
    end
  end
  describe "DELETE #destroy" do
    Devise::Test::ControllerHelpers

    before do
      sign_in(create(:user, :admin))
    end

    it "deletes the payment" do
      delete :destroy, params: { id: payment.id }
      expect(Payment.count).to eq(0)
    end

    it "redirects to payment#index" do
      delete :destroy, params: { id: payment.id }
      expect(response).to have_http_status(302)
    end
  end
end
