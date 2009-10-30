#!/usr/bin/env ruby1.9
#/usr/bin/env ruby1.9 -w

#require_relative 'resolver'
require 'resolver'

def read_input_file(filename)
	casenum, rownum, colnum = 0,0,0;
	mymatrix = []
	begin
		file = File.open(filename, "r")
		line = file.gets;
		totalcasenum = line.to_i
		while casenum < 2#totalcasenum
			casenum+=1
			line = file.gets
			rownum = line.split(' ')[0].to_i
			colnum = line.split(' ')[1].to_i
			puts "casenum #{casenum} rownum #{rownum} colnum #{colnum}"
			while rownum > 0
				line = file.gets
				line[-1]='' #remove trail charactor, string length=11
				mymatrix.push(line.split('').to_a)
				rownum-=1
			end
			yield mymatrix
			mymatrix = []
		end 
#print_matrix(mymatrix)
		file.close
	rescue => err
		puts "Exception: #{err}"
		err
	end
end

if __FILE__ == $0
	filename="A-small-practice.in"
	read_input_file(filename) do |matrix|
		resolver = Resolver.new(matrix)
	end
end
