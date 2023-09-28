class AddIconToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :icon, :string, default: "link"
    add_column :links, :icon_style, :string, default: "solid"
  end
end
