#!/usr/bin/env ruby1.9 -w

#require_relative 'spot'
#require_relative 'util'
require 'spot'
require 'util'

class Resolver
	def initialize(matrix)
		@matrix = matrix
        parse_matrix
        set_goal
		print_boxes
		print_matrix(@matrix); puts
		start
	end
	def move_box(box)
		target = box.which_way?
		if target
			move_to(box, target)
			return true
		else
			puts "no way to go"
			return false
		end
	end
	def switch_current_box
		if @current_box == @box1
			@current_box = @box2
		else
			@current_box = @box1
		end
	end
	def start
		@current_box = @box1
		if @box1.on_your_way?(@box2)
			@current_box = @box2
		end
		counter=0
		while !(@box1.done == true and @box2.done == true)
			if move_box(@current_box) == false
				switch_current_box
			else
				if keep_moving?(@current_box) != true
					switch_current_box
				end
			end
#            puts @box1.done
#            puts @box2.done
			counter+=1
		end
		puts "total step = #{counter}"
	end
	def keep_moving?(box)
		if dangerous?(box)
			cross_spots = find_cross_spot
			if(cross_spots.length > 1)
				target = remove_back_step(box, cross_spots)[0]
#puts "found one"
				puts target.inspect if target
				return true
			else
				if back_step?(box, cross_spots)
#puts "backstep"
					return false
				end
			end
		end
		puts "i_don't_know'"
		return "i_don't_know'"
	end
	def find_cross_spot
		cross_spots = []
		get_neighbours(@box1).each do |near_box1| 
			get_neighbours(@box2).each do |near_box2| 
				cross_spots.push(near_box1) if near_box1 == near_box2
			end
		end
		cross_spots
	end
	def back_step?(box, cross_spots)
		cross_spots.each do |spot|
			return false if box.old_coordinate != spot
		end
		true
	end
	def remove_back_step(box, cross_spots)
		cross_spots.each do |spot|
			if box.old_coordinate == spot
#                puts cross_spots.inspect
#                puts box.old_coordinate
				cross_spots.delete(spot)
#                puts cross_spots.inspect
			end
		end
		cross_spots
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
			box.old_coordinate = box.coordinate
			box.coordinate = spot_to 
#            puts box.coordinate.inspect
#            puts spot_to.inspect
			box.done = true if (box.goal.coordinate == spot_to)
#             if (box.goal.coordinate == spot_to)
#                box.done = true
#                puts "done"
#             end
		end
#puts box
		print_matrix(@matrix)
		puts
	end
	def update_matix
	end
end

if __FILE__ == $0
end
