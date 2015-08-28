require 'spec_helper'

describe PurchaseInvoicesController do
  routes { OfficeClerk::Engine.routes }

  before { create :admin  unless Clerk.where(admin: true).first }
  let(:valid_session) { { clerk_email: Clerk.where(admin: true).first.email } }
  describe "GET #show" do
    it "assigns the requested purchase as @purchase" do
      purchase = create :purchase
      get :show, {id: purchase.to_param}, valid_session
      expect(assigns(:purchase)).to eq(purchase)
      end
    it "assigns @template" do
      purchase = create :purchase
      get :show, {id: purchase.to_param}, valid_session
      expect(assigns(:template)).to eq("purchase_invoice")
    end
  end
end
