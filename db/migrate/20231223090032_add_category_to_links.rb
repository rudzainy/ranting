class AddCategoryToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :category, :integer, default: 0
  end
end
