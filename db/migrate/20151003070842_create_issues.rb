class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :category_id
      t.integer :language_id
      t.text :title

      t.timestamps null: false
    end
  end
end
