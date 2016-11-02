class TransactionsController < ApplicationController
	def create
		cuenta = Cuenta.find_by_address(params[:address])
		if cuenta.nil?
			flash[:error] = "La cuenta ingresada no existe."
			redirect_to :root and return
		end
		if params[:instruction].to_i == 0 and cuenta.saldo < params[:transaction][:amount].to_i
			flash[:error] = "La cuenta ingresada no tiene saldo suficiente."
			redirect_to "/cuentas/"+cuenta.address and return
		end
		if Digest::SHA256.hexdigest(params[:transaction][:password]) != cuenta.address
			flash[:error] = "El password ingresado es incorrecto."
			redirect_to "/cuentas/"+cuenta.address and return
		end
		t = Transaction.new
		t.cuenta_id = cuenta.id
		t.amount = params[:transaction][:amount]
		t.description = params[:transaction][:description]
		t.instruction = params[:transaction][:instruction].to_i
		if t.save
			flash[:success] = "Transaccion creada exitosamente."
		end
		redirect_to "/cuentas/"+cuenta.address and return
	end
end
