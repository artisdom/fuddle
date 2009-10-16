#!/usr/bin/env ruby1.9 -w

require 'matrix'
require_relative 'spot'
require_relative 'util'

class Resolver
	def initialize(matrix)
		@matrix = matrix
		puts "Resolver constructor"
        parse_matrix
        set_goal
        print_boxes
		puts movable?(@box1)
puts movable?(@box2)
#print_matrix(@matrix)
	end
	def print_boxes
		puts @box1
		puts @box2
	end
	def parse_matrix
		puts "parse_matrix"
		rownum, colnum = 0,0
		firstbox, firstgoal = 0,0
		@matrix.each do |row|
			row.each do |char|
				if char == 'o'
					if(firstbox == 0)
						@box1 = Box.new([rownum, colnum])
						firstbox=1
					else
						@box2 = Box.new([rownum, colnum])
					end
				elsif char == 'x'
					if(firstgoal == 0)
						@goal1 = Spot.new([rownum, colnum], :goal)
						firstgoal=1
					else
						@goal2 = Spot.new([rownum, colnum], :goal)
					end
				elsif char == 'w'
#TODO:add w parse
				end
				colnum+=1
			end
			rownum+=1
			colnum=0
		end
#puts
	end
	def set_goal
		@box1.set_goal(@goal1)
		@box2.set_goal(@goal2)
	end
	def movable?(box)
		counter = 0
		blockers = []
		get_neighbours(box).each do |near| 
			[nil, 'o', 'x', 'w', '#'].each do |blocker|
				if spot_type(near) == blocker
					blockers.push(near)
					counter +=1
					if counter == 2 and same_line(blockers)
						return false
					end
					if counter == 3
						return false
					end
				end
			end
		end
		true
	end
	def same_line(blockers)
		if blockers[0][0] == blockers[1][0] or blockers[0][1] == blockers[1][1]
			return true
		else
			return false
		end
	end
	def spot_type(spot)
		@matrix[spot[0]][spot[1]]
	end
	def get_neighbours(box)
		[
			[box.x-1, box.y],
			[box.x+1, box.y],
			[box.x, box.y-1],
			[box.x, box.y+1]
		]
	end
	def update_matix
	end
end

if __FILE__ == $0
end
