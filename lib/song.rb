require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song=Song.new #?
    @@all << song
    return @@all.last
    #binding.pry
  end

  def self.new_by_name(name)
    song=Song.new(name)
    @@all << song
    return @@all.last
  end

  def self.create_by_name(name)
    song=Song.new(name)
    @@all << song
    return @@all.last
  end

  def self.find_by_name(name)
    @@all.find{|name1|
      name==name1.name  
    }
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
    self.create_by_name(name)
    end
  end

  def self.alphabetical
    return @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(filename)
    filearr = filename.split(' ')
    filearr.delete("-")
    mp3 = filearr.last.split('')
    filearr.delete(filearr.last)
    4.times{mp3.pop}
    #binding.pry
    filearr.push(mp3.join(''))
    filefirst = filearr.first
    filearr.delete(filearr.first)
    Song.new(filearr.join(' '),filefirst)
  end
  def self.create_from_filename(filename)
    filearr = filename.split(' ')
    filearr.delete("-")
    mp3 = filearr.last.split('')
    filearr.delete(filearr.last)
    4.times{mp3.pop}
    #binding.pry
    filearr.push(mp3.join(''))
    filefirst = filearr.first
    filearr.delete(filearr.first)
    song = Song.new(filearr.join(' '),filefirst)
    @@all << song
  end
  def self.destroy_all
    @@all.clear
  end
end

