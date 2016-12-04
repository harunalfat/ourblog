class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :updater, references: :users

      t.timestamps
    end
  end
end
