class EntriesController < ApplicationController
  
  def index
    if session["user_id"] 
      @entries = Entry.where(user_id: session["user_id"])  
    else
      redirect_to "/login", notice: "You must be logged in to view your entries."  
    end
  end

  
  
  
  
  def new
  end

  def create
    if session["user_id"] 
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = session["user_id"] 

      if @entry.save
        redirect_to "/places/#{@entry["place_id"]}", notice: "Entry created successfully!"
      else
        redirect_to "/entries/new", notice: "Failed to create entry."
      end
    else
      redirect_to "/login", notice: "You must be logged in to create an entry."
    end
  end
end
