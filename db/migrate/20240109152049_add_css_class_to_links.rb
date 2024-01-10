class AddCssClassToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :css_class, :integer, default: 0
  end
end
