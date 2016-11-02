class TransactionsController < ApplicationController
	def create
		cuenta = Cuenta.find_by_address(params[:address])
		if cuenta.nil?
			flash[:error] = "La cuenta ingresada no existe."
			redirect_to :root
		end
		if cuenta.saldo < params[:amount].to_i
			flash[:error] = "La cuenta ingresada no tiene saldo suficiente."
		else
			t = Transaction.new
			t.cuenta_id = cuenta.id
			t.amount = params[:amount]
			t.description = params[:description]
			instruction = params[:instruction]
			t.save
		end
		redirect_to cuenta
	end
end
