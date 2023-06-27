class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.belongs_to :word, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.string :colour
      t.boolean :selected, default: false

      t.timestamps
    end
  end
end
