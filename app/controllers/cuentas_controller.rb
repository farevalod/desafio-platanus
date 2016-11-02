class CuentasController < ApplicationController
	def show
		cuenta = Cuenta.find_by_address(params[:address])
		if cuenta.nil?
			cuenta = Cuenta.new
			cuenta.address = params[:address]
			cuenta.save
		end
	end
end
