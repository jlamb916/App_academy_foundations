require_relative "room"
require "byebug"
class Hotel
  
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        #map takes in a block
        @name.split(" ").map(&:capitalize).join(" ")
        #words = @name.split(" ")
        #words.map! do |word|
        #    word.capitalize
        #end
        #words.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end 
    end
    room["asd"] = {}
    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} : #{room.available_space}"
        end
    end
end