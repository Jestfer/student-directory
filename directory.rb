# All methods can access these variables below
@students = []
@name = ""
@cohort = ""

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  @name = STDIN.gets.chomp

  while !@name.empty? do
    puts "Which cohort do you belong to?"
    @cohort = STDIN.gets.chomp
    @cohort == "" ? @cohort = "Mmm... must be from the Heroes Academy" : @cohort = @cohort
    # Method to add the student hash to the array
    store_student
    puts "Now we have #{@students.count} students"

    @name = STDIN.gets.chomp
  end
end

def store_student
  @students << {name: @name, cohort: @cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|

  @name, @cohort = line.chomp.split(',')
    store_student
  end
  file.close
end

def try_load_students
  # filename = ARGV.first # first argument from command line
  filename = "students.csv"
  return if filename.nil? # exit the method if argument not given
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu