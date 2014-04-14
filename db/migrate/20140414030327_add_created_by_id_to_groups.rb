class AddCreatedByIdToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :created_by_id, :integer
  end

  def self.down
    remove_column :groups, :created_by_id
  end
end
