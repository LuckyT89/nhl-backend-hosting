class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :number
      t.string :name
      t.string :position
      t.integer :age
      t.string :height
      t.integer :weight
      t.string :image_url
      t.belongs_to :team, foreign_key: true
    end
  end
end
