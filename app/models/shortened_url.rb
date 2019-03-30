require 'securerandom'
class ShortenedUrl < ActiveRecord::Base
  validates_presence_of :orig_url
  UrlRegex = /https?:\/\/[\S]+/
  validates_format_of :orig_url, :with => UrlRegex
  before_create :generate_short_url
  before_create :sanitize
  
  def generate_short_url
    puts "coming here"
    new_short_url = SecureRandom.hex(10)
    old_url = ShortenedUrl.find(:conditions => ["short_url ?",new_short_url]).last
    if old_url.present?
      self.generate_short_url
    else
      self.short_url = new_short_url
    end
  end
  
  def check_duplicate
    ShortenedUrl.find_by_sanitize_url(self.santize_url)    
  end
  
  def new_url?
    check_duplicate.nil?
  end
  
  def sanitize
    self.orig_url.strip!
    self.sanitize_url = self.orig_ul.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.sanitize_url = "https://#{self.sanitize_url}"
  end


end
