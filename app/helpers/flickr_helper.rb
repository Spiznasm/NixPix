module FlickrHelper

  def user_photos(user_id, photo_count=12)
    photo_array = []
    FlickRaw.api_key = ENV["flickr_key"]
    FlickRaw.shared_secret = ENV["flickr_secret"]
    flickr = FlickRaw::Flickr.new
    flickr.photos.search(:user_id => user_id, :extras => "url_q").each { |photo| photo_array << photo }
  end

  def group_photos(user_id, photo_count=12, columns=4)
    begin
      photos = user_photos(user_id, photo_count).in_groups_of(columns)
      render :partial => "static_pages/grouped_photos", :locals => { :photos => photos }
    rescue Exception => error
      render :partial => "static_pages/unavailable", :locals => { :message => error.message }
    end

  end

end
