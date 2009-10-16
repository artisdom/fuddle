#!/usr/bin/env ruby -w

class Spot
	attr_accessor :coordinate
	attr_accessor :type
	def initialize(coordinate, type)
		@coordinate = coordinate
		@type = type
#puts to_s
	end
	def x
		coordinate[0]
	end
	def y
		coordinate[1]
	end
	def to_s
#"#{type}(#{coordinate[0]}" ", " "#{coordinate[1]})"
		"#{type}(#{x}" ", " "#{y})"
	end
end

class Box < Spot
	attr_accessor :dangerous
	attr_accessor :goal
	def initialize(coordinate)
		super(coordinate, :box)
		@dangerous = false
		@goal = nil
	end
	def set_goal(goal)
		@goal = goal
	end
	def to_s
		super.to_s + "->#{goal}"
	end
	def movable?
	end
end

if __FILE__ == $0
	coord = [1, 1]
	spot = Spot.new(coord, :wall)
	puts spot
end
