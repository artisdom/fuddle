#!/usr/bin/env ruby1.9
#/usr/bin/env ruby1.9 -w

require_relative 'resolver'

def read_input_file(filename)
	rownum, colnum, linenum = 0,0,0;
	mymatrix = []
	begin
		file = File.open(filename, "r")
		while(line = file.gets)
			linenum = linenum + 1
			if(linenum == 1)
				casenum = line; 
			elsif(linenum <= 12)
				if(line.length <= 6)
					rownum = line.split(' ')[0]
					colnum = line.split(' ')[1] 
				else
					line[-1]='' #remove trail charactor, string length=11
					mymatrix.push(line.split('').to_a)
				end
			else
				break
			end
		end 
		print_matrix(mymatrix)
		file.close
		mymatrix
	rescue => err
		puts "Exception: #{err}"
		err
	end
end

if __FILE__ == $0
	filename="A-small-practice.in"
	resolver = Resolver.new(read_input_file(filename))
end
