class AddUserRefToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :user, foreign_key: true
  end

  Group.all.map {|g| g.update!(user_id: g.links.first.user.id)}
end
