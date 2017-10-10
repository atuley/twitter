class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.timestamps
    end
    add_index :favorites, :tweet_id
    add_index :favorites, :user_id
  end
end
