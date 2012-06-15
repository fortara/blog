class UploadController < ApplicationController
  def index
  end
  def upload
    uploaded_io = params[:file]
    #File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #  file.write(uploaded_io.read)
    #end
    #flash[:notice] = "upload "+uploaded_io.original_filename+" successfully" 
    flash[:notice] = uploaded_io.read
    render :action=>'index'
  end
  def now
    #render :action=>'index'
    render :text=>"Server Response:"+DateTime.now.to_s
  end
end
