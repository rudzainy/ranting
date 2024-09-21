class CreateMailingListEmail < ActiveRecord::Migration[7.0]
  def change
    create_table :mailing_list_emails do |t|
      t.string :email_address, unique: true

      t.timestamps
    end
  end
end
