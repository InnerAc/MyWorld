class AddAvatarColumnsToAvatars < ActiveRecord::Migration
  def self.up
    add_attachment :avatars, :avatar
  end

  def self.down
    remove_attachment :avatars, :avatar
  end
end
