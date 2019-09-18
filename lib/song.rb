require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    if self.all.include?(song) 
      return song
    else
    song.save
    end
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find do |instance|
      instance.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by do |instance|
      instance.name
    end
  end
  
  def self.new_from_filename(file)
    split_song = file.split(".")
    splitter = split_song[0].split(" - ")
    song_name = splitter[0]
    song_artist = splitter[1]
    song = self.create
    song.artist_name = splitter[0]
    song.name = splitter[1]
    song
  end 
  
  def self.create_from_filename(file)
    split_song = file.split(".")
    splitter = split_song[0].split(" - ")
    song_name = splitter[0]
    song_artist = splitter[1]
    song = self.create
    song.artist_name = splitter[0]
    song.name = splitter[1]
    self.all << song
  end
  
  def self.destroy_all
    @@all = []
  end
#binding.pry
  
  
  
  
  
end
