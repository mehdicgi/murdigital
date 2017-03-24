class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :img_src
      t.string :color
      t.string :picto

      t.timestamps
    end
  end
end
