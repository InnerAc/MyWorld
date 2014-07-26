module BlogsHelper
	def avatar_thumb(blog)
		# blog.avatar.to_json
		blog.avatar.avatar.url(:thumb) if blog.avatar
	end
end
