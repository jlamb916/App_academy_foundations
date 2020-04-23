#@@ class attribute
#@ instance attribute 

#require "passenger"

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
            return true
        else
            return false
        end
    end

    def board_passenger(passenger)
        if !full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        else
            puts "sorry flight is full"
        end
    end
#   passanger [ @Name , flight]
    def list_passengers

        @passengers.map do |passenger|
            passenger.name
        end

    end

    def [](i)
        @passengers[i]
    end
    
    def <<(passenger)
        board_passenger(passenger)
    end
    

end