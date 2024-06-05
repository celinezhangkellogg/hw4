class EntriesController < ApplicationController

  def show
    @entry = Entry.order("id decs")
  end


  def new
  end

  def create
    @current_user = User.find_by({ "id" => session["user_id"] })
  if @current_user != nil
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.uploaded_image.attach(params["image"])
    # when create an entry, it is assigned to whoever logged in
    @entry["user_id"] = session["user_id"]
    @entry.save
  else 
    flash["notice"] = "Login first."
  end
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
