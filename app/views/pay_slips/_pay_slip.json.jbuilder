json.extract! pay_slip, :id, :slip_no, :name, :income, :created_at, :updated_at
json.url pay_slip_url(pay_slip, format: :json)
