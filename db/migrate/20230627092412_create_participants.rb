class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.string :name
      t.string :role
      t.string :team

      t.timestamps
    end
  end
end
