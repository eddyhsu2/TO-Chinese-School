class LibraryBook < ActiveRecord::Base

  LIBRARY_BOOK_TYPE_SIMPLIFIED = 'S'
  LIBRARY_BOOK_TYPE_TRADITIONAL = 'T'

  LIBRARY_BOOK_TYPES = [LIBRARY_BOOK_TYPE_SIMPLIFIED, LIBRARY_BOOK_TYPE_TRADITIONAL]

  validates_presence_of :title, :publisher, :book_type

end
