require 'pry'

class Owner
  @@all = []
  attr_accessor :name, :pets, :fishes, :cats, :dogs
  attr_reader :species

  def initialize (species)
    @species = species
    @pets = {:cats=>[], :dogs=>[], :fishes=>[]}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @pets
  end

  def buy_fish(name)
    name = Fish.new(name)
    self.pets[:fishes] << name
  end

  def buy_cat(name)
    name = Cat.new(name)
    self.pets[:cats] << name
  end

  def buy_dog(name)
    name = Dog.new(name)
    self.pets[:dogs] << name
  end

  def walk_dogs
    pets[:dogs].collect do |dog|
      dog.mood = "happy"      #how do you change the mood if only one instance was stored (without each)?
    end
  end

  def play_with_cats
    pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |type, pet_array|
      pet_array.map do |pet|
        pet.mood = "nervous" 
      end
      pet_array.clear
    end  
  end

  def list_pets
    fish_count = pets[:fishes].count
    cats_count = pets[:cats].count
    dogs_count = pets[:dogs].count
    "I have #{fish_count} fish, #{dogs_count} dog(s), and #{cats_count} cat(s)."
  end



end