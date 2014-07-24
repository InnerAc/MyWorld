class AddIsboyToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :is_boy, :boolean
  end
end
