class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
     location = current_user.location
     @events = Bandsintown::Event.search({
      :location => location,
      :start_date => Time.now,
      :end_date => 1.week.from_now
    })

    # @artists = Artist.all
    #   if params[:search]

    #     @artists= Artist.search(params[:search]).order("created_at DESC")
    #   else
    #     @artists = Artist.all.order('created_at DESC')
    #   end
     @user_artist = UserArtist.new
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])
    name = @artist.name
    @events = Bandsintown::Event.search({
      :artists => [name]
    })
    @user_artist = UserArtist.new
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    # @artist = Artist.create()
    name = params[:name]

      artist = Bandsintown::Artist.new({
        :name => name
      })
      @artist = Artist.create(name: artist.name)

     respond_to do |format|
       if @artist.save
         format.html { redirect_to @artist }
         format.json { render :show, status: :created, location: @artist }
       else
         format.html { render :new }
         format.json { render json: @artist.errors, status: :unprocessable_entity }
       end
     end

      #   redirect_to artist_path(@artist.id)

  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :on_tour)
    end
end
