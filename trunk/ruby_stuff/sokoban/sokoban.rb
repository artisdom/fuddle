#!/usr/bin/env ruby -w

=begin
def read_input_file_test
	puts "read_input_file"
	linenum = 0;
	file = File.new("/home/cidana/hostshare/A-small-practice.in", "r")
	while(line = file.gets)
		linenum = linenum + 1
		if(linenum <= 12)
			puts "#{linenum}" "\t" "#{line}"  
		else	
			break
		end
	end
		while(line = file.gets)
			linenum = linenum + 1
			if(linenum == 1)
				casenum = line;
				puts "casenum = #{casenum}"  
			elsif(linenum <= 12)
				puts "#{linenum}" "\t" "#{line}"
			else
				break
			end
		end
		content=[]
		file.each_line {|line|
			content.push line
		}
		puts "#{content[1]}"
	file.close
end
=end
require 'matrix'
def read_input_file
	puts "read_input_file"
	rownum = 0;
	colnum = 0;
	linenum = 0;
	rows=[]
	begin
		file = File.open("/home/cidana/hostshare/A-small-practice.in", "r")
		while(line = file.gets)
			linenum = linenum + 1
			if(linenum == 1)
				casenum = line;
				puts "casenum = #{casenum}"  
			elsif(linenum <= 12)
				if(line.length <= 6)
					rownum = line.split(' ')[0]
					colnum = line.split(' ')[1]
					puts "rownum=#{rownum}, colnum=#{colnum}"
				else
					line[-1]='' #remove trail charactor, string length=11
					rows.push(line.to_a())
					m = Matrix[rows]
#puts line
				end
			else
				break
			end
		end
		puts "\n" "#{m}"
		file.close
	rescue => err
		puts "Exception: #{err}"
		err
	end
end

if __FILE__ == $0
	read_input_file
end
