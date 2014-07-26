class ChangeBlogUser < ActiveRecord::Migration
  def change
  	change_table :blogs do |t|
  		t.remove :editor
  		t.belongs_to :user

  	end
  end
end
