class AddGroupIdSchoolIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :group_id, :integer
    add_column :posts, :school_id, :integer
  end

  def self.down
    remove_column :posts, :school_id
    remove_column :posts, :group_id
  end
end
