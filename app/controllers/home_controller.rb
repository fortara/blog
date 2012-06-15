class HomeController < ApplicationController
  def index
  end
  def upload
    img=params[:img]
    content_size=img.size
    file_data=img.read
    filetype=img.content_type
    @filename=img.original_filename
    File.open("/home/ayu7/blog/public/uploads"+@filename,"wb"){|f| f.write (file_data)}
    flash[:notice]="File:"+@filename+" uploaded successfully <br/>"+" it's saved at /home/ayu7/blog/public/uploads"+@filename
    render :action=>'index'
  end
end
