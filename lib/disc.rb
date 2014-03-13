class CD
  attr_reader(:artist, :album)

  @@collection = []

  def initialize(input_hash)
   @album = input_hash[:album]
   @artist = input_hash[:artist]
  end

  def CD.collection
    @@collection
  end

  def CD.create(input_hash)
    new_cd = CD.new(input_hash)
    @@collection << new_cd
    new_cd
  end

  def CD.clear
    @@collection = []
  end
  def CD.search_artist(artist_name)
    found_artists = []
    CD.collection.each_with_index do |cd, index|
      if artist_name == cd.artist
        found_artists << cd.album
      end
    end
    found_artists
  end
  def CD.search_album(album_name)
    CD.collection.each do |cd|
      if album_name == cd.album
        return cd
      end
    end
  end
  def CD.delete(artist, album)
    CD.collection.each_with_index do |cd, index|
      if cd.album == album && cd.artist == artist
        CD.collection.delete_at(index)
      end
    end
  end
end
