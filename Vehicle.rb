module Hood
    def open_hood
        puts "The hood is opened"
    end

    def close_hood
        puts "The hood is closed"
    end
end
    
class Vehicle
    @@vehicles = 0
    attr_accessor :color
    attr_reader :year
    attr_reader :model

    public

        def initialize(year,color,model)
            @year = year
            @color = color
            @model = model
            @speed = 0
            @@vehicles += 1
        end

        def speed_up(amount)
            @speed += amount
            puts "The vehicle has speed up to #{@speed}."
        end

        def brake(amount)
            @speed -= amount
            puts "The vehicle is on brake. The speed is #{@speed}."
        end

        def off
            @speed = 0
            puts "The vehicle is off."
        end

        def spray_paint(new_color)
            self.color = new_color
            puts "The new color is #{@color}."
        end

        def self.gas_mileage(gallons, miles)
            puts "#{miles/gallons} miles per gallon of gas."
        end

        def self.number_of_vehicles
            puts "The total number of vehicles is #{@@vehicles}."
        end

        def age
            puts "Your #{self.model} is #{years_old} years old."
        end

    private

        def years_old 
            Time.now.year - self.year
        end
end

class MyCar < Vehicle
    include Hood
    
    
    def initialize(year,color,model)
       super
    end

    def to_s
        return "My car is a #{@year} #{@color} #{@model}."
    end
end

class MyTruck < Vehicle
    attr_accessor :color
    attr_reader :year
    
    def initialize(year,color,model)
       super
    end

    def to_s
        return "My truck is a #{@year} #{@color} #{@model}."
    end
end

rav = MyCar.new(2015, 'silver', 'RAV')
rav.speed_up(30)
rav.brake(10)
rav.off()

rav.color = 'black'

rav.spray_paint('yellow')

MyCar.gas_mileage(10,50)
puts rav

gmc = MyTruck.new(2020, 'white', 'GMC')
puts gmc

Vehicle.number_of_vehicles
rav.open_hood

#puts MyCar.ancestors
#puts MyTruck.ancestors
#puts Vehicle.ancestors
rav.age

