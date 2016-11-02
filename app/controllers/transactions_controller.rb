class TransactionsController < ApplicationController
	def create
		cuenta = Cuenta.find_by_address(params[:address])
		if cuenta.nil?
			flash[:error] = "La cuenta ingresada no existe."
			redirect_to :root
		end
		if cuenta.saldo < params[:amount].to_i
			flash[:error] = "La cuenta ingresada no tiene saldo suficiente."
			redirect_to cuenta
		end
		if Digest::SHA256.hexdigest params[:password] != cuenta.address
			flash[:error] = "El password ingresado es incorrecto."
			redirect_to cuenta
		end
		t = Transaction.new
		t.cuenta_id = cuenta.id
		t.amount = params[:amount]
		t.description = params[:description]
		instruction = params[:instruction]
		if t.save
			flash[:success] = "Transaccion creada exitosamente."
		end
		redirect_to cuenta
	end
end
