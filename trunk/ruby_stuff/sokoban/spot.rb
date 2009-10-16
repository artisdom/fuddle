#!/usr/bin/env ruby -w

class Spot
	attr_accessor :coordinate
	attr_accessor :type
	def initialize(coordinate, type)
		@coordinate = coordinate
		@type = type			  
	end
	def to_s
		"Spot (#{coordinate[0]}" ", " "#{coordinate[1]}) #{type}"	
	end
end

class Box < Spot
	attr_accessor :dangerous
	def initialize(coordinate)
		@coordinate = coordinate
		@type = :box
		@dangerous = false
	end
	def movable?
	end
end

if __FILE__ == $0
	coord = [1, 1]
	spot = Spot.new(coord, :wall)
	puts spot
end
