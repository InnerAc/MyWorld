class AddAvatarColumnToBlogs < ActiveRecord::Migration
  def change
  	change_table :blogs do |t|
  		t.belongs_to :avatar
  	end
  end
end
