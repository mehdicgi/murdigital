class AddLogoToDisplay < ActiveRecord::Migration[5.0]
  def change
    add_column :displays, :logo, :string
  end
end
