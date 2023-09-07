class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      
      #以下、チャレンジ機能#
      #t.integer :genre_id, null: false
      #t.boolean :is_active, null: false
      #ここまで#

      t.timestamps
    end
  end
end
