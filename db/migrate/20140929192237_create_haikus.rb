class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
      t.string :text

      t.timestamps
    end
  end
end
