class CreateDarts < ActiveRecord::Migration
  def change
    create_table :darts do |t|
      t.string :name
      t.integer :size
      t.float :percentage

      t.timestamps
    end
  end
end
