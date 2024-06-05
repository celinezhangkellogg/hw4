class SessionsController < ApplicationController
  
  def new
  end

  def create

    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user !=nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
    # 3. if they know their password -> login is successful

        # cookies
        session["user_id"] = @user["id"]
       
         flash["notice"] = "Welcome."
         redirect_to "/"
    # 4. if the user doesn't exist or they don't know their password -> login fails
      else
      flash["notice"] = "Nope."
      redirect_to "/login"
      end
    end
  end

  def destroy

    # delete the cookies
    session["user_id"] = nil

    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  