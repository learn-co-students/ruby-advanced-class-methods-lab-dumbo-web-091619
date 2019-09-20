require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    matching_song = @@all.find do |song|
      song.name == song_name
    end
      matching_song
  end

  def self.find_or_create_by_name(song_name)
    if !find_by_name(song_name)
      create_by_name(song_name)
    else 
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = self.new
    filename_array = filename.split(" - ")
    song_name = filename_array[-1]
    song.name = song_name.slice(0...song_name.index("."))
    song.artist_name = filename_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    filename_array = filename.split(" - ")
    song_name = filename_array[-1]
    song.name = song_name.slice(0...song_name.index("."))
    song.artist_name = filename_array[0]
    song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end