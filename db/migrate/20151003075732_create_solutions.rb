class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :issue_id
      t.text :description

      t.timestamps null: false
    end
  end
end
