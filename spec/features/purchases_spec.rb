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
      # how we can do it with I18n.t("#{@template}.header")?
      expect(page).to have_content ("Purchase Invoice")
    end
  end
end
