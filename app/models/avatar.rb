class Avatar < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" },:default_url => "/pictures/ava/head1.jpg"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :blogs
end
