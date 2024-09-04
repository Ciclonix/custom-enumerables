module Enumerable
  def my_each_with_index
    for idx in (0...self.size)
      yield self[idx], idx
    end
    return self
  end

  def my_select
    temp = []
    self.each do |x|
      temp << x if yield x
    end
    return temp
  end

  def my_all?
    self.each do |x|
      return false unless yield x
    end
    return true
  end

  def my_any?
    self.each do |x|
      return true if yield x
    end
    return false
  end

  def my_none?
    self.each do |x|
      return false if yield x
    end
    return true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.each do |x|
      count += 1 if yield x
    end
    return count
  end

  def my_map
    temp = []
    self.each do |x|
      temp << yield(x)
    end
    return temp
  end

  def my_inject(result = nil)
    self.my_each_with_index do |x, idx|
      if result == nil && idx == 0
        result = self[0]
      else
        result = yield result, x
      end
    end
    return result
  end
end


class Array
  def my_each
    for elem in self
      yield elem
    end
  end
end
