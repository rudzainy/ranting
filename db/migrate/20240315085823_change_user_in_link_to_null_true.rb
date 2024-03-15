class ChangeUserInLinkToNullTrue < ActiveRecord::Migration[7.0]
  def change
    change_column_null :links, :user_id, true
  end
end
