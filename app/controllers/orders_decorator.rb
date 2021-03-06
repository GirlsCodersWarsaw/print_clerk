# encoding : utf-8
OrdersController.class_eval do

  def button_list
    load_order
    render :layout => false
  end

  def receipt
    load_order
  end

  def invoice
    load_order
    @invoice = true
    @template = "invoice"
  end

  # slip is an invoice without prices
  def slip
    load_order
    @slip = true
    @template = "slip"
    render "invoice"
  end

  # reminder is an invoice with an extra text to kindly pay up
  def reminder
    load_order
    @reminder = true
    @template = "reminder"
    render "invoice"
  end

end
