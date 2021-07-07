require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new()
    @@all << song
    song
    # binding.pry
  end 

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end 

  def self.create_by_name(name)
    song = self.create 
    song.name = name
    song
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.find do |song_title| 
      song_title.name == name
    # binding.pry
    end
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    splited = filename.split(" - ")
    artist = splited[0]
    songtitle = splited.slice(1)[0...-4]
    # binding.pry
    song = self.create
    song.name = songtitle
    song.artist_name = artist
    song
  end
 
  def self.create_from_filename(filename)
    splited = filename.split(" - ")
    artist = splited[0]
    songtitle = splited.slice(1)[0...-4]

    song = self.create
    song.name = songtitle
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end


end

# binding.pry