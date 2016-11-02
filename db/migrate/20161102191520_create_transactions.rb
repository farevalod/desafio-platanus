class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
	  t.integer :cuenta_id
	  t.string :description
	  t.integer :amount
	  t.integer :instruction
      t.timestamps null: false
    end
  end
end
