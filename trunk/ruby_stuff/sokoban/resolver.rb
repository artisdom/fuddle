#!/usr/bin/env ruby -w

require 'matrix'
require_relative 'spot'
require_relative 'util'

class Resolver
	def initialize(matrix)
		@matrix = matrix
		puts "Resolver constructor"
		print_matrix(@matrix)
	end
	def parse_matrix
	end
	def set_goal
	end
	def update_matix
	end
end

if __FILE__ == $0
end
