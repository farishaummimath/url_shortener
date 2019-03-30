class AddSantizeUrltoShortenedUrls < ActiveRecord::Migration
  def self.up
      add_column :shortened_urls, :sanitize_url, :string, :unique => true
  end

  def self.down
     remove_column :shortened_urls, :sanitize_url
  end
end
