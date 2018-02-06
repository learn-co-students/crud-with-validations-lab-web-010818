class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    @song = Song.find_by(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end


end
