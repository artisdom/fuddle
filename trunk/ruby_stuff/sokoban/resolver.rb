#!/usr/bin/env ruby1.9 -w

require 'matrix'
require_relative 'spot'
require_relative 'util'

class Resolver
	def initialize(matrix)
		@matrix = matrix
        parse_matrix
        set_goal
		print_boxes
		start
#print_matrix(@matrix)
	end
	def start
		move_to(@box2, [5, 8])
		puts dangerous?(@box2)
	end
	def print_boxes
		puts @box1
		puts @box2
	end
	def parse_matrix
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
					return false if counter == 2 and same_line?(blockers)
					return false if counter == 3
				end
			end
		end
		true
	end
	def same_line?(blockers)
		return true if blockers[0][0] == blockers[1][0] or blockers[0][1] == blockers[1][1]
		false
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
	def can_move_to?(spot)
		[nil, 'o', 'w', '#'].each do |blocker|
			return false if spot_type(spot) == blocker
		end
		true
	end
	def dangerous?(box)
		get_neighbours(box).each do |near|
			return false if @matrix[near[0]][near[1]] == 'o'
		end
		true
	end
	def move_to(box, spot_to)
#puts box
		if can_move_to?(spot_to)
			if box.type == :box
				from = '.'
			elsif box.type == :box_and_goal
				from = 'x'
			end
			@matrix[box.x][box.y] = from
			if spot_type(spot_to) == '.'
				box.type = :box
				to = 'o'
			elsif spot_type(spot_to) == 'x'
				box.type = :box_and_goal
				to = 'w'
			end
			@matrix[spot_to[0]][spot_to[1]] = to
			box.coordinate = spot_to 
		end
#puts box
		print_matrix(@matrix)
	end
	def update_matix
	end
end

if __FILE__ == $0
end
