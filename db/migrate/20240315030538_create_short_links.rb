class CreateShortLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :short_links do |t|
      t.references :link
      t.string :statistics_token
      t.string :url_token
      t.timestamps
    end
  end
end
