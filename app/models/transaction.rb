class Transaction < ActiveRecord::Base
	belongs_to :cuenta
	def deposit?
		return instruction == 1
	end
end
