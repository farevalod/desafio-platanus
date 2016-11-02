class CreateCuenta < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
	  t.string :address
      t.timestamps null: false
    end
  end
end
