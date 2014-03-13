require './lib/disc.rb'

def main_menu
  puts "\n\nWelcome to Your CD Library!"
  puts "Type 'a' to add an album to your Collection"
  if CD.collection.length > 0
    puts "Type 'l' to list your cd's in your collection"
    puts "Type 'sa' to Search Artists"
    puts "Type 's' to Search by Album"
    puts "Type 'd' to trash some things"
  end
  puts "Type 'x' to Exit."
  user_choice = gets.chomp
  case user_choice
    when 'a'
      add_cd
    when 'l'
      list_cd
    when 'sa'
      puts "Which Artist Do You Want to Search For?"
      artist_name = gets.chomp
      search_artist(artist_name)
      main_menu
    when 's'
      search_album
    when 'd'
      delete
    when 'x'
      puts "Yea!  Goodbye."
    else
      puts "Not a valid input!"
      main_menu
    end
end


def add_cd
  puts "What is the Artist Name?"
      new_artist = gets.chomp
      puts "What is the Album Name?"
      new_album = gets.chomp
      CD.create({:artist => new_artist, :album => new_album})
      puts "You've Added #{CD.collection.last.artist}'s #{CD.collection.last.album} to your collection"
      main_menu
  end

  def list_cd
    puts "All the cds in your collection"
      CD.collection.each_with_index do |cd, index|
        puts "#{index+1}. #{cd.artist}, #{cd.album}"
      end
      main_menu
  end

  def search_artist(artist)

      found_albums = CD.search_artist(artist)
      puts "#{artist} Albums:"
      found_albums.each_with_index do |album, index|
        puts "#{index+1} #{album}"
      end
  end

def search_album
  puts "Which Album Do you Want to Search For?"
      album_name = gets.chomp
      found_cd = CD.search_album(album_name)
      puts "#{found_cd.artist}, #{found_cd.album}\n\n"
end

 def delete
   puts "Type the Artist and Album that you want to delete"
   puts "Enter the Artist:"
   artist = gets.chomp
   search_artist(artist)
   puts "Enter the Album:"
   album = gets.chomp
   CD.delete(artist, album)
   puts "You removed #{artist}'s #{album} from your Collection"
   main_menu
 end
  main_menu
