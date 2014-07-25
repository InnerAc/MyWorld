require 'digest/sha2'
class User < ActiveRecord::Base

	def User.auth(name,password)
		if user = find_by_name(name)
			if user.pwd== password
				user
			end
		end
	end

	private
		def password_must_be_present
			errors.add(:password,"Missing password")unless pawd.present?
		end

end
