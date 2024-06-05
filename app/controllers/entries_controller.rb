class EntriesController < ApplicationController

  def show
   
    # only show your own entries
    @entries = Entry.where({ "contact_id" => @contact["id"] }, {"user_id" => session["user_id"]})

  end



  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
