class AddMigrationToDarts < ActiveRecord::Migration
  def change
    add_column :darts, :completed, :boolean
  end
end
