class UploadController < ApplicationController
  require "csv"
  require "fileutils"
  def index
  end
  def upload
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    #flash[:notice] = "upload "+uploaded_io.original_filename+" successfully" 
    flash[:notice] = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    #flash[:notice] = uploaded_io.read
    #render :action=>'index'
    redirect_to :controller => "upload", :action=> "show"
  end
  def show
    @file=flash[:notice]
#    @infoblox=Array.new
#    f=File.new @file
#    f.readlines.each do |value|
#      @infoblox.push(value)
#    end

    @arr=Array.new
    i=0
    CSV.open(@file,'r') do |csv|
      csv.each do |row|
        @arr[i]=row
        i=i+1
      end
    end
    @row=@arr.size-1
    @column=@arr[0].size-1
     
  end
  def execute
    redirect_to :controller => "upload", :action=> "execute"
  end
  def now
    #render :action=>'index'
    render :text=>"Server Response:"+DateTime.now.to_s
  end
end
