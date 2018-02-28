class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
    add_index :email
  end
end
