class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :fullname, null: false
      t.string :password_digest, null: false
      t.text :biography, null: false

      t.timestamps
    end
  end
end
