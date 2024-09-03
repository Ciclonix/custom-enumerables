module Enumerable
  def my_each_with_index
    for idx in (0...self.size)
      yield self[idx], idx
    end
    return self
  end
end

class Array
  def my_each
    for elem in self
      yield elem
    end
  end
end
