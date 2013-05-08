class AddUrlToDarts < ActiveRecord::Migration
  def change
    add_column :darts, :url, :string
  end
end
