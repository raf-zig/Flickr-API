class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new 

    if params[:user_id]
      begin
        @photos = flickr.photos.search(user_id: params[:user_id])
      rescue Flickr::FailedResponse
        flash.now[:alert] = "User doesn't exist"
        @photos = nil
      end
    end
  end
end
