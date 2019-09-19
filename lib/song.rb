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
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    falsey = nil
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    falsey
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song,name|
      song.name
    end
  end

  def self.new_from_filename(filename)
    parsed_file = filename.split("-")
    artist_name = parsed_file[0].strip
    parsed_file_2 = parsed_file[1].split(".")
    name = parsed_file_2[0].strip

    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = name
    new_song
  end

  def self.create_from_filename(filename)
    parsed_file = filename.split("-")
    artist_name = parsed_file[0].strip
    parsed_file_2 = parsed_file[1].split(".")
    name = parsed_file_2[0].strip

    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = name
    new_song

    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end

end