class CreateStaticContents < ActiveRecord::Migration
  def change
    create_table :static_contents do |t|
      t.string :type, null: false
      t.text :content, null: false
      t.references :updater, references: :users

      t.timestamps
    end
  end
end
