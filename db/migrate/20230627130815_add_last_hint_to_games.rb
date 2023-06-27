class AddLastHintToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :last_hint_text, :string
    add_column :games, :last_hint_number, :integer
  end
end
