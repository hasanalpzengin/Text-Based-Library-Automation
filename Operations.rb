require "./Book.rb"

module Op

  def Op.get_list(file_name)
    books = []
    lb_file = File.open(file_name,"r")
    lb_file.each_line do |line|
      book_info = {}
      book_str = line.split("$")
      book_info["name"]=book_str[0]
      book_info["type"]=book_str[1]
      book_info["author"]=book_str[2]
      book_info["page_count"]=book_str[3]
      book_info["availability"]=book_str[4]
      books.push(Book.new(book_info['name'],book_info['type'],book_info['author'],book_info['page_count'],book_info["availability"]))
    end
    lb_file.close
    return books;
  end

  def Op.print_list(books_array)
    count = 0
    books_array.each do |book|
      puts "-"*20
      puts "ID: #{count}"
      puts "Name: #{book.get_name}"
      puts "Type: #{book.get_type}"
      puts "Author: #{book.get_author}"
      puts "Page Count: #{book.get_page_count}"
      puts "Availability: #{book.get_availability}"
      count += 1
    end
  end

  def Op.add_book(file_name,name,type,author,page_count,availability)
    lb_file = File.open(file_name,"a")
    lb_file.puts "#{name}$#{type}$#{author}$#{page_count}$#{availability}"
    lb_file.close
  end

  def Op.delete_book(file_name,id)
    count = 0
    #temporary book list
    book_list = []
    File.foreach(file_name) do |line|
      book_list.push line unless count==id
      count += 1
    end

    new_file = File.open(file_name, "w")
    #write book list to file
    book_list.each do |line|
      new_file.puts line
    end

    new_file.close
  end

  def Op.change_availability_book(file_name,id)
    count = 0
    change_book = String
    #temporary book list
    book_list = []
    File.foreach(file_name) do |line|
      if count != id
        book_list.push line
      else
        change_book = line
      end
      count += 1
    end
    #change book status
    change_book_info = change_book.split("$")
    if change_book_info[4].include?("true")
      change_book_info[4] = "false"
    else
      change_book_info[4] = "true"
    end
    change_book = change_book_info.join("$")

    new_file = File.open(file_name, "w")
    #write book list to file
    max_count = book_list.length
    count = 0
    (0..max_count).each do |i|
      if i == id
        new_file.puts change_book
      else
        new_file.puts book_list[count]
        count += 1
      end
    end
    new_file.close
  end

  def Op.search_book(file_name,search)
    count = 0
    found = []
    lb_file = File.open(file_name, "r")
    lb_file.each_line do |line|
      book = line.split("$")
      found.push(count)  if book[0] == search
      count += 1
    end

    puts "#{found.length} Item Founded Which is Matches With You Search"
    puts "Id's are #{found.join(', ')}"
    lb_file.close

  end

end
