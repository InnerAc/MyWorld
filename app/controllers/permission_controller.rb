class PermissionController < ApplicationController
	before_action :authorize

	def authorize
		if session[:user_id].nil?
			redirect_to login_url
		end
	end

end