class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :name
      t.string :public_key
      t.string :secrate_key

      t.timestamps null: false
    end
  end
end
