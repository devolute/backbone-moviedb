class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.timestamps
      t.string :title, :category
      t.text :description
    end
  end
end
