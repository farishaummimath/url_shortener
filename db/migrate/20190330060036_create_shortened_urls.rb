class CreateShortenedUrls < ActiveRecord::Migration
  def self.up
    create_table :shortened_urls do |t|
      t.text :orig_url
      t.string :short_url

      t.timestamps
    end
  end

  def self.down
    drop_table :shortened_urls
  end
end
