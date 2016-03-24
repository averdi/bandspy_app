class UserArtistsController < ApplicationController

  def index
  # Get all user's artists from user_artists table
  # by finding all artist_id that is with user_id
   @artist = Artist.new
    @user_artists = UserArtist.where(:user_id => current_user.id)

  # Match artist_id from user_artists table to id in artists table
  # to get name from artist table

      @my_artists = @user_artists.map { |user_artist| Artist.where(:id => user_artist.artist_id) }

  # List all artists by name with link to artists#show
  end

  def new
    @user_artist = UserArtist.new

  end

  def create

    # adding new user artist

    @user_artist = UserArtist.new(user_artist_params)

    respond_to do |format|
      if @user_artist.save
        format.html { redirect_to root_path, notice: 'Artist was successfully followed.' }
        format.json { render :show, status: :created, location: @user_artist }
      else
        format.html { render :new }
        format.json { render json: @user_artist.errors, status: :unprocessable_entity }
      end
    end



  end

  def destroy
    raise
    @my_artist.destroy
    respond_to do |format|
      format.html { redirect_to user_user_artists_path(current_user.id), notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_artist_params
    params.require(:user_artist).permit(:user_id, :artist_id)
  end

 def artist_params
      params.require(:artist).permit(:name, :on_tour)
    end
end
