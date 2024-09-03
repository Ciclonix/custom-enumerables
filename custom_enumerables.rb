module Enumerable
  
end

class Array
  def my_each
    for elem in self
      yield elem
    end
  end
end