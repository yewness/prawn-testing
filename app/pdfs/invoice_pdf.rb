require 'prawn'
class InvoicePdf < Prawn::Document
	def initialize(invoice)
		super(top_margin: 70)
		@invoice = invoice
		table client_information
	end

	def client_information
    [[invoice = @invoice.invoice_no]]
	end
end
