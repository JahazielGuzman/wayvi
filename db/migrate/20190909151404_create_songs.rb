class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :year
      t.string :genre
      t.string :path
      t.string :artist_name
      t.belongs_to :artist

      t.timestamps
    end
  end
end
