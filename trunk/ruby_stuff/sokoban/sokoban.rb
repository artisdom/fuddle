#!/usr/bin/env ruby1.9
#/usr/bin/env ruby1.9 -w

require 'matrix'
require_relative 'resolver'

def read_input_file(filename)
	puts "read_input_file()"
	rownum, colnum, linenum = 0,0,0;
	rows=[]
	begin
		file = File.open(filename, "r")
		while(line = file.gets)
			linenum = linenum + 1
			if(linenum == 1)
				casenum = line; 
#puts "casenum = #{casenum}"  
			elsif(linenum <= 12)
				if(line.length <= 6)
					rownum = line.split(' ')[0]
					colnum = line.split(' ')[1] 
#puts "rownum=#{rownum}, colnum=#{colnum}"
				else
					line[-1]='' #remove trail charactor, string length=11
#puts line
					rows.push(line)
#rows.push(line.to_a())
					matrix = Matrix[rows]
				end
			else
				break
			end
		end 
#puts "\n" 
#print_matrix(matrix)
		file.close
		matrix
	rescue => err
		puts "Exception: #{err}"
		err
	end
end

if __FILE__ == $0
	filename="/home/cidana/hostshare/A-small-practice.in"
	resolver = Resolver.new(read_input_file(filename))
end
