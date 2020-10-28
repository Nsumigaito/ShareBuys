class Users::SetsController < ApplicationController
  	before_action :authenticate_user!

	def setting
	end
end
