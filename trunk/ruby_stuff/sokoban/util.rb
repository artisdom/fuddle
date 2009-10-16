#!/usr/bin/env ruby1.9 -w

def print_matrix(m)
	m.each do |row|
		puts row.inspect
	end
end
=begin

def print_matrix(matrix)
	matrix.map do |row|
		puts row
	end
end	
=end
