class Cuenta < ActiveRecord::Base
	has_many :transactions
	self.table_name = "cuentas"
	def saldo
		total = 0
		transactions.each do |t|
			if t.deposit?
				total += t.amount
			else
				total -= t.amount
			end
		end
		return total
	end
end
