class CreateDisplays < ActiveRecord::Migration[5.0]
  def change
    create_table :displays do |t|
      t.string :name
      t.integer :show_date
      t.integer :show_from
      t.integer :show_limit
      t.integer :columns
      t.integer :lines
      t.text :consigne

      t.timestamps
    end
  end
end
