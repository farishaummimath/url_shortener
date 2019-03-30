class ShortUrlsController < ApplicationController
  protect_from_forgery
  def index
   @url = ShortenedUrl.new
  end
  
  def show    
    @url = ShortenedUrl.find_by_short_url(params[:short_url])
    redirect_to @url.sanitize_url
  end
  
  def create
    puts "ceasss"
    @url = ShortenedUrl.new
    @url.orig_url = params[:orig_url]
    @url.sanitize
    if @url.new_url?
      puts "new"
      if @url.save
        puts "sAVE"
        redirect_to short_urls_path(@url.short_url)
      else
        flash[:error] =" Cannot be saved"
        render 'index'
      end
    else
      flash[:error] =" Already existed URL"
      redirect_to short_urls_path(@url.check_duplicate.short_url)
    end
  end
  
  def shortened
    @url = ShortenedUrl.find_by_short_url(params[:short_url])
    host = request.host_with_port
    @orig_url = @url.sanitize_url
    @short_url = host+"/"+ @url.short_url
  end

end
