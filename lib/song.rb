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
    @@all.push(song)
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end 

 def self.create_by_name(name)
   song = self.new 
   @@all.push(song)
   song.name = name 
   song
 end 
 
 def self.find_by_name(name)
    @@all.find{|song| song.name == name}
 end 


 def self.find_or_create_by_name(name)
   if self.find_by_name(name) != nil 
     self.find_by_name(name)
   else 
     self.create_by_name(name)
   end 
 end 
   
   def self.alphabetical
     @@all.sort_by{|a| a.name}
   end 
   
  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end
   
  def self.create_from_filename(file_name)
    created_song = self.new
    created_song.name = file_name.split(" - ")[1].split(".")[0]
    created_song.artist_name = file_name.split(" - ")[0]
    @@all.push(created_song)
  end
 
 def self.destroy_all
   @@all = []
   
 end 
 
 
end
