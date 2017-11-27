#Library Automation
#By Hasan Alp Zengin
require "./Operations.rb"

@file_name = 'librarydb.txt'
#Model
def menu_select(choose)
  case choose
  when "1"
    add_menu()
  when "2"
    delete_menu()
  when "3"
    list_menu()
  when "4"
    search_menu()
  when "5"
    change_menu()
  when "0"
    exit
  else
    puts "You Entered Wrong Menu Item"
  end
  main_screen
end

#View
def print_library()
  puts "-"*20
  puts "+Menu"
  puts "-"*20
  puts "1. Add Book"
  puts "2. Delete Book"
  puts "3. List Book"
  puts "4. Search Book"
  puts "5. Change Availability Of Book"
  puts "0. Exit"
  puts "-"*20
  puts "Select An Item From List :"
end

#Controller
def main_screen()
  print_library()
  choose = $stdin.gets.chomp
  menu_select(choose)
end

def add_menu()
  puts "-New Book"
  print "Name: "
  name = $stdin.gets.chomp
  print "Type: "
  type = $stdin.gets.chomp
  print "Author: "
  author = $stdin.gets.chomp
  print "Page count: "
  page_count = $stdin.gets.chomp.to_i
  print "Availability (false or true): "
  availability = ($stdin.gets.chomp=="false" ? false : true)
  Op.add_book(@file_name, name, type, author, page_count, availability)
end

def delete_menu()
  print "Enter ID which will be deleted book: "
  id = $stdin.gets.chomp.to_i
  Op.delete_book(@file_name,id)
end

def list_menu()
  Op.print_list(Op.get_list(@file_name))
end

def change_menu()
  print "Enter id of the book that you want to change: "
  id = $stdin.gets.chomp.to_i
  Op.change_availability_book(@file_name,id)
end

def search_menu()
  print "Enter name of book that you want to search: "
  search = $stdin.gets.chomp
  Op.search_book(@file_name,search)
end

def file_check()
  if !File.exist?(@file_name)
    created_file = File.open(@file_name,"w")
    created_file.close()
    puts "#{@file_name} File Created at Project Directory"
  end
end

file_check
main_screen
