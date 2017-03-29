class Sudoku
 
    def initialize(string)
    @string = string
    #create_board
  end
 
def print_board
  board = @string
  table = board.each_line(9).to_a
table.each_with_index do |line, index|
  if index == 0
    puts "-"*21
  elsif index == 3 || index == 6
    puts "- "*11
  end
line.each_with_index do |x, index|
    print "#{x} "
  if index == 2 || index == 5
    print "| "
   elsif index == 8
     puts "\n"
  end
end 
 
end
  puts "-"*21
end
 
   def solve
   while @string.include? ("0")
    @string.scan(/\w/).each_with_index do |value, index|
    
     if value == "0"
      index
      @index = index
        rows
        cols
        boxs
        index_row
        index_col
        index_box
        exist_row
        exist_col
        exist_box
        missing
        check
      end
    end
  end
   table = @string.scan(/./).each_slice(9).to_a
  table.each_with_index do |line, index|
  if index == 0
    puts "-"*21
  elsif index == 3 || index == 6
    puts "- "*11
  end
line.each_with_index do |x, index|
    print "#{x} "
  if index == 2 || index == 5
    print "| "
   elsif index == 8
     puts "\n"
  end
end
 
end
 
end
 
def exist_row
  exist_row = @rows[index_row].gsub(/[0]/, "")
    Array(1..9) - exist_row.split(//).map {|elem| elem.to_i}
  end
 
  def exist_col
 
    exist_col = @cols[index_col].gsub(/[0]/, "")
    Array(1..9) - exist_col.split(//).map {|elem| elem.to_i}
end
  
  def exist_box
    exist_box = @boxs[index_box].gsub(/[0]/, "")
    Array(1..9) - exist_box.split(//).map {|elem| elem.to_i}
  end
    def missing
   exist_row & exist_box & exist_col
end
  
   def check
     if missing.length == 1
    @string[@index] = missing.pop.to_s
    else
    end
  end
 
 
 
 
   def rows
    @rows = []
    @string.scan(/.{9}|.+/).each {|row| @rows << row}
    @rows
  end
 
  def cols
    @cols = []
    for j in 0...9
      column_holder = ""
      for i in 0...9
        column_holder << @rows[i][j]
      end
      @cols << column_holder
    end
    @cols
  end
 
def boxs
    @boxs = []
    for m in 0...3
      for k in 0...3
        box_holder = ""
        for j in 0...3
          for i in 0...3
            box_holder << @rows[j+(m*3)][i+(k*3)]
          end
        end
        @boxs << box_holder
      end
    end 
    @boxs
  end
 
 
  def index_row
    @index / 9
  end
 
  def index_col
    @index  - (@index / 9) * 9
  end
 
  def index_box
    if index_row < 3 && index_col < 3
      0
    elsif index_row < 3 && index_col < 6
      1
    elsif index_row < 3 && index_col < 9
      2
    elsif index_row < 6 && index_col < 3
      3
    elsif index_row < 6 && index_col < 6
      4
    elsif index_row < 6 && index_col < 9
      5
    elsif index_row < 9 && index_col < 3
      6
    elsif index_row < 9 && index_col < 6
      7
    else
      8
    end
  end
 
 
 
 
 
 
 
 
 
def print_board
  board = @string
  table = board.each_line(9).to_a
table.each_with_index do |line, index|
  if index == 0
    puts "-"*21
  elsif index == 3 || index == 6
    puts "- "*11
  end
line.each_with_index do |x, index|
    print "#{x} "
  if index == 2 || index == 5
    print "| "
   elsif index == 8
     puts "\n"
  end
end 
 
end
  puts "-"*21
end
end
sudoku = Sudoku.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')
sudoku.solve