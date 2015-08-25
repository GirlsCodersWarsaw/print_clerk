require 'spec_helper'

describe "Purchases" do
  before do
    sign_in
  end
  it "should render print button", js: true do
    purchase = create :purchase
    visit_path purchase_path(purchase)
    expect(page).to have_link("Print Invoice" , href: "/purchases/#{purchase.id}/invoice")
  end
  describe "purchase invoice" do
    it "shows total" do
      purchase = create :purchase
      visit_path "#{purchase_path(purchase)}/invoice"
      expect(page).to have_content I18n.t(:purchase_total)
    end
    it "shows header" do
      purchase = create :purchase
      visit_path "#{purchase_path(purchase)}/invoice"
      expect(page).to have_content I18n.t("purchase_invoice.header")
    end
    it "shows footer_left" do
      purchase = create :purchase
      visit_path "#{purchase_path(purchase)}/invoice"
      expect(page).to have_content (OfficeClerk.config(:footer_left))
    end
  end
end

