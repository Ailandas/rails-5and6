class ShopController < ApplicationController
  before_action :getItems
  $file_data
  def getItems
    file = File.open("#{Rails.root}/public/pcnames.txt") #Simuliuojama duomenu baze
    $file_data = file.readlines #Nuskaitomos eilutes
    
  end
  
  def items
    @Items=[]
    $file_data.each do |n|
      singleRecord=n.split(',') #Reiksmes atskirtos kableliais
      @Items << singleRecord[0] #Patalpinamos visu prekiu pavadinimai
    end

  end
  def nesiojami
    @Laptops=[]
    $file_data.each do |n|
      singleRecord=n.split(',')
      category=singleRecord[1].to_s #Pasiverciama i string
      category=category.strip #Panaikinami tusti simboliai (white spaces)
      if category == "0" then # kategorija 0 yra nesiojami kompiuteriai
        @Laptops << singleRecord[0] # Jei nesiojamas, tai pasiimu pavadinima
      end
    end
    
    
  end

  def stacionarus
    @Personal=[]
    $file_data.each do |n|
      singleRecord=n.split(',')
      category=singleRecord[1].to_s #Pasiverciama i string
      category=category.strip #Panaikinami tusti simboliai (white spaces)
      if category == "1" then # kategorija 1 yra nesiojami kompiuteriai
        @Personal << singleRecord[0] # Jei nesiojamas, tai pasiimu pavadinima
      end
    end
  end

  def namai
    @Photos=["Person.jpg","laptop.png","personal.png"]
  end


end
