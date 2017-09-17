json.extract! invoice, :id, :invoice_no, :name, :payment_mode, :bank_detail, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
