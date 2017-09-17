class CreatePaySlips < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_slips do |t|
      t.string :slip_no
      t.string :name
      t.string :income

      t.timestamps
    end
  end
end
