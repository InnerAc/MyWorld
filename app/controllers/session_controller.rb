class SessionController < ApplicationController
	# get /login
	def index
		unless session[:user_id].nil?
			redirect_to index_url
		end
	end

	# post /login
	def create
		if teacher = User.auth(params[:name],params[:password])
			session[:user_id]=teacher.id
			session[:user_name]=teacher.name
			redirect_to index_url
		else
			redirect_to login_url,:alert => "不正确的用户名/密码"
		end
	end

	# delete /logout
	def destroy
		session[:user_id]=nil
		redirect_to login_url,notice: "已退出登录"
	end
end
