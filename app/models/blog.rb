class Blog < ActiveRecord::Base
	validates :title, :summary, :content, :presence =>true
	belongs_to :user
	belongs_to :avatar
end
