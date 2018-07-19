require'pry'
class Owner
  attr_accessor :pets
  attr_writer :name
  attr_reader :species

  @@all = []
  @@owner_count = 0

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
    @@owner_count+=1
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@owner_count=0
  end

  def self.count
    @@owner_count
  end

  def say_species
    "I am a #{@species}."
  end

  def name
    @name
  end

#do I need to also create attributes for fish or not? NO!
  def buy_fish(name)
    fishy = Fish.new(name)
    @pets[:fishes] << fishy
  end

  def buy_cat(name)
    catty = Cat.new(name)
    @pets[:cats] << catty
  end

  def buy_dog(name)
    doggy = Dog.new(name)
    @pets[:dogs] << doggy
  end

  def walk_dogs
    @pets[:dogs].each do |doggy|
      doggy.mood ="happy"
    end
  end


  def play_with_cats
    @pets[:cats].each do |catty|
      catty.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fishy|
      fishy.mood = "happy"
    end
  end
  

  def sell_pets
    @pets.each do |type, pets|
      pets.each do |pet|
          pet.mood = "nervous"
        end
      end
    @pets = {fishes: [], cats: [], dogs: []}
  end

=begin
#alternative solution - neater to use .clear method on values
  def sell_pets
  pets.each do |species, animals|
    animals.each do |animal|
      animal.mood = "nervous"
    end
    animals.clear
  end
end
=end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end



end

=begin
An owner will know about all its pets,
be able to buy a pet, or pets (many instances of a dog for ex)
set the name of a pet (which the pet can't change, because that would be weird),
change a pet's mood through walking, feeding, or playing with it, (associate to pet mood attribute)
and sell all of its pets (for when it moves to that tiny NYC studio after college).
=end
