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
   new_song = self.new
   @@all << new_song
   new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(input)
    author_song_name_array = input.split("-")
    song = self.new
    song.artist_name = author_song_name_array[0].strip
    song_name_part = author_song_name_array[1].split(".")
    song.name = song_name_part[0].strip
    song
  end

  def self.create_from_filename(input)
    song = self.new_from_filename(input)
    @@all << song
  end

  def self.destroy_all
    @@all =[]
  end



end
