# All methods can access these variables below
@students = []
@name = ""
@cohort = ""

def input_students
  puts "To finish, just hit return twice"

  add_new_student

  keep_adding_students
end

def store_student
  @students << {name: @name, cohort: @cohort.to_sym}
end

def add_new_student
  @name = STDIN.gets.chomp
end

def keep_adding_students
  while !@name.empty? do
    puts "Which cohort do you belong to?"
    @cohort = STDIN.gets.chomp
    @cohort == "" ? @cohort = "Mmm... must be from the Heroes Academy" : @cohort

    store_student
    puts "Now we have #{@students.count} students"

    add_new_student
  end
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

def choose_option(selection)
  case selection
    when "1"
      puts "Please add the student(s) name(s)"
      input_students
    when "2"
      puts "Displaying the student(s) for your academy."
      show_students
    when "3"
      puts "Saving the student(s) data into your file."
      save_students
    when "4"
      puts "Loading the student(s) data from your file"
      load_students
    when "9"
      puts "See you soon"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  puts "Please add the file (and extension) where you'd like to save the list."
  user_file = gets.chomp
  # file = File.open("students.csv", "w")
  file = File.open(user_file, "w")
  
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Please add the file (and extension) where you'd like to load the list from."
  filename = gets.chomp
  file = File.open(filename, "r")
  file.readlines.each do |line|

  @name, @cohort = line.chomp.split(',')
    store_student
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from command line
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
    choose_option(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu