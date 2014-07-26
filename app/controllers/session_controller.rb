class SessionController < ApplicationController
	# get /login
	def index
		unless session[:user_id].nil?
			redirect_to index_url
		end
	end

	# post /login
	def create
		if user = User.auth(params[:name],params[:password])
			session[:user_id]=user.id
			session[:user_name]=user.name
			session[:user_is_admin]=user.is_admin
			redirect_to index_url
		else
			redirect_to login_url,:alert => "不正确的用户名/密码"
		end
	end

	# delete /logout
	def destroy
		session[:user_id]=nil
		session[:user_is_admin]=nil
		session[:user_name]=nil
		redirect_to login_url,notice: "已退出登录"
	end
end
