class AddMoveToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :move_team, :string
    add_column :games, :move_role, :string
  end
end
