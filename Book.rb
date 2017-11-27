class Book

  #set book_name and type
  def initialize(name,type,author,page_count,availability)
    @name = name
    @type = type
    @author = author
    @page_count = page_count
    @availability = availability
  end
  #set available status
  def set_availability(availability)
    @availability = availability
  end

  def get_availability()
    return @availability
  end

  def get_name()
    return @name
  end

  def set_name(name)
    @name = name
  end

  def get_type()
    return @type
  end

  def set_type(type)
    @type = type
  end

  def get_author()
    return @author
  end

  def set_author(author)
    @author = author
  end

  def get_page_count()
    return @page_count
  end

  def set_page_count(page_count)
    @page_count = page_count
  end

end
