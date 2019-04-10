class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])    
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(params_song)
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(params_song)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  def params_song
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
