class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_no
      t.string :name
      t.string :payment_mode
      t.string :bank_detail

      t.timestamps
    end
  end
end
