require 'pry'

class Owner
  @@all = []
  attr_accessor :pets, :name, :mood
  def initialize(name)
    @@all << self
    @name = name
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
  end
  
  def buy_cat(name)
    new = Cat.new(name)
    self.pets[:cats] << new
  end
  
  def buy_dog(name)
    new = Dog.new(name)
    self.pets[:dogs] << new
  end
  
  def buy_fish(name)
    new = Fish.new(name)
    self.pets[:fishes] << new
  end
  
  def self.all
    @@all
  end
  
  def self.count
    def self.reset_all
      all.clear
    end
    self.all.size
  end
  
  def species
    "human"
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def walk_dogs
    self.pets[:dogs].each{|dog| dog.mood = "happy"}
  end
  
  def play_with_cats
    self.pets[:cats].each{|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    self.pets[:fishes].each{|fish| fish.mood = "happy"}
  end
  
  def sell_pets
   self.pets.values.each do |pet|
     pet.each do |one|
       one.mood = "nervous"
     end
   end
   pets.clear
  end
  
  def list_pets
    "I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
  end
end