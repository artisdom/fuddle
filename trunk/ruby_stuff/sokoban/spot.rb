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
	attr_accessor :coordinate, :dangerous , :goal, :old_coordinate, :done
	def initialize(coordinate)
		super(coordinate, :box)
		@old_coordinate
		@dangerous = false
		@goal = nil
		@done = false
	end
	def set_goal(goal)
		@goal = goal
	end
	def to_s
		super.to_s + "->#{goal}" 
	end
	def which_way?
		blockers = []
		blockers.push(coordinate)
		blockers.push(goal.coordinate)
#        puts blockers.inspect
        if blockers[0][0] == blockers[1][0] # x eq
			if blockers[0][1] > blockers[1][1] # box on right
				target = [blockers[0][0], blockers[0][1]-1]
			elsif # box on left
				target = [blockers[0][0], blockers[0][1]+1]
			end
        elsif blockers[0][1] == blockers[1][1] # y eq
			if blockers[0][0] > blockers[1][0] # box on down
				target = [blockers[0][0]-1, blockers[1][0]]
			elsif # box on up
				target = [blockers[0][0]+1, blockers[1][0]]
			end
        end
		target
#        puts target.inspect
	end
	def on_your_way?(box)
		blockers = []
		blockers.push(coordinate)
		blockers.push(goal.coordinate)
		blockers.push(box.coordinate)
#puts blockers.inspect
		if (blockers[0][0] == blockers[1][0] and blockers[1][0] == blockers[2][0]) 
			return true
		end
		if (blockers[0][1] == blockers[1][1] and blockers[1][1] == blockers[2][1])
			return true
		end
		false
	end
end

if __FILE__ == $0
	coord = [1, 1]
	spot = Spot.new(coord, :wall)
	puts spot
end
