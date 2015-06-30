class CreateShortenedLinks < ActiveRecord::Migration
  def change
    create_table :shortened_links do |t|
      t.text :website_url
      t.string :unique_identifier

      t.timestamps null: false
    end
  end
end
