class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :state
      t.string :winning_team

      t.timestamps
    end
  end
end
