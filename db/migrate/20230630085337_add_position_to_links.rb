class AddPositionToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :position, :integer

    User.all.each do |user|
      user.links.order(:updated_at).each.with_index(1) do |link, index|
        link.update_column :position, index
      end
    end
  end
end
