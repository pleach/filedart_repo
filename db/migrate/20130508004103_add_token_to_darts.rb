class AddTokenToDarts < ActiveRecord::Migration
  def change
    add_column :darts, :token, :string
  end
end
