class AddEditorToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :editor, :string
  end
end
