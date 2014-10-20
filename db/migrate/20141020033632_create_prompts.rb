class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :name
      t.string :description
      t.string :action

      t.timestamps
    end
  end
end
