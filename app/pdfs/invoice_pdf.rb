require 'prawn'
class InvoicePdf < Prawn::Document
	def initialize(invoice)
		super(top_margin: 50, page_size: "A4")
		@invoice = invoice
    font_size 8
    header
    employee_detail(invoice)
    bounding_box([0, 620], :width => 260, :height => 200) do
      table income_information(invoice) do
        row(0).style font_style: :bold
        row(1..2).style border_width: 0
        column(0).style do |c|
          c.width = 180
        end
        column(1).style do |c|
          c.width = 80
          c.align = :center
        end
      end
      table allowance_information(invoice), position: :left do
        row(0).style font_style: :bold, border_width: 0
        row(1..2).style border_width: 0
        column(0).style do |c|
          c.width = 180
        end
        column(1).style do |c|
          c.width = 80
          c.align = :center
        end
      end
    end
    bounding_box([0, 420], :width => 260, :height => 200) do
      table total_amount(invoice) do
        row(0).style font_style: :bold
        row(1..2).style border_width: 0
        column(0).style do |c|
          c.width = 180
        end
        column(1).style do |c|
          c.width = 80
          c.align = :center
        end
      end
    end

    bounding_box([260, 620], :width => 260, :height => 200) do
      table deduction_information(invoice) do
        row(0).style font_style: :bold
        row(1..2).style border_width: 0
        column(0).style do |c|
          c.width = 180
        end
        column(1).style do |c|
          c.width = 80
          c.align = :center
        end
      end
    end
    bounding_box([260, 420], :width => 260, :height => 200) do
      table net_total_amount(invoice) do
        row(0).style font_style: :bold
        row(1..2).style border_width: 0
        column(0).style do |c|
          c.width = 180
        end
        column(1).style do |c|
          c.width = 80
          c.align = :center
        end
      end
    end
	end

  def header
    image "#{Rails.root}/app/assets/images/logo.png", height: 40, :width => 120
    move_down 20
  end

  def employee_detail(invoice)
    text "Name: #{invoice.name}"
    move_down 5
    text "Mode Of Payment: #{invoice.payment_mode}"
    move_down 5
    text "Bank Detail: #{invoice.bank_detail}"
    move_down 5
    text "Bank Account No.: #{invoice.invoice_no}"
    move_down 10
  end

	def income_information(invoice)
    stroke_color '000000'
    stroke_bounds
    vertical_line 0, 180, :at => 180
    [
      ['INCOME', 'RM'],
      [invoice.invoice_no, 'he'],
      [invoice.invoice_no, 'hed'],
    ]
	end

  def allowance_information(invoice)
    [
      ['Allowance', ''],
      [invoice.invoice_no, 'he'],
      [invoice.invoice_no, 'hed']
    ]
  end

  def deduction_information(invoice)
    stroke_color '000000'
    stroke_bounds
    vertical_line 0, 180, :at => 180
    [
      ['DEDUCTION', 'RM'],
      [invoice.invoice_no, 'he'],
      [invoice.invoice_no, 'hed']
    ]
  end

  def total_amount(invoice)
    [
      ['Total', '1000'],
    ]
  end

  def net_total_amount(invoice)
    [
      ['Net Total', '2000'],
    ]
  end
end
