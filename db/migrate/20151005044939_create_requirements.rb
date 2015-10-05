class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :project_name
      t.text :requirement

      t.timestamps null: false
    end
  end
end
