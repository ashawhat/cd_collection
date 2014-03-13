require 'rspec'
require 'disc'

describe CD do
  before do
    CD.clear
  end

  describe '.clear' do
    it 'empties the Collection Array' do
      CD.create({:artist =>"Animals",:album => "Doors"})
      CD.clear
      CD.collection.should eq []
    end

  end
  it 'should initialized with a hash of attributes' do
    test_CD = CD.new({:artist => "Bob Dylan", :album => "Crossroads"})
    test_CD.should be_an_instance_of CD
  end
  it 'initializes with an artist name' do
  test_CD = CD.new({:artist => "Bob Dylan", :album => "Crossroads"})
  test_CD.artist.should eq "Bob Dylan"
  end
  it 'initializes with an album name' do
  test_CD = CD.new({:artist => "Bob Dylan", :album => "Crossroads"})
  test_CD.album.should eq "Crossroads"
  end
  describe '.collection' do
    it 'starts as an empty array' do
    CD.collection.should eq []
    end
  end
  describe '.create' do
    it 'creates a new CD class object' do
      test_CD = CD.create({:artist =>"Animals",:album => "Doors"})
      test_CD.album.should eq "Doors"
      test_CD.artist.should eq "Animals"
    end
    it 'saves the CD object into the Collection Array' do
      test_CD = CD.create({:artist =>"Animals",:album => "Doors"})
      CD.collection.should eq [test_CD]
    end
  end
  describe '.search_artist' do
    it "Returns the array of albums of the Searched Artist" do
    test_CD = CD.create({:artist => "Janelle Monae", :album =>"Possibilities"})
    test_CD2 = CD.create({:artist => "Janelle Monae", :album => "Anachroid"})
    CD.search_artist("Janelle Monae").should eq ["Possibilities", "Anachroid"]
    end
  end
  describe ".album_search" do
    it 'object of the searched album' do
      test_CD = CD.create({:artist => "Janelle Monae", :album =>"Possibilities"})
      test_CD2 = CD.create({:artist => "Janelle Monae", :album => "Anachroid"})
      CD.search_album("Possibilities").should eq test_CD
    end
  end
  describe ".delete" do
    it "deletes a CD" do
      test_CD = CD.create({:artist => "jimmy biffet", :album =>"greatest hits"})
      test_CD2 = CD.create({:artist => "Janelle Monae", :album => "greatest hits"})
      CD.delete("Janelle Monae", "greatest hits")
      CD.collection.should eq [test_CD]
    end
  end
end
