class AddUserRefToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :user, foreign_key: true
    
    Group.all.each do |group| 
      group.update(user_id: group.links.first.user.id)
    end
  end
end
