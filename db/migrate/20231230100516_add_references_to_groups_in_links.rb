class AddReferencesToGroupsInLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :group, foreign_key: true
  end
end
