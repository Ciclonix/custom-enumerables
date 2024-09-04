module Enumerable
  def my_each_with_index
    for idx in (0...size)
      yield self[idx], idx
    end
    return self
  end

  def my_select
    temp = []
    each do |x|
      temp << x if yield x
    end
    return temp
  end

  def my_all?
    each do |x|
      return false unless yield x
    end
    return true
  end

  def my_any?
    each do |x|
      return true if yield x
    end
    return false
  end

  def my_none?
    each do |x|
      return false if yield x
    end
    return true
  end

  def my_count
    return size unless block_given?

    count = 0
    each do |x|
      count += 1 if yield x
    end
    return count
  end

  def my_map
    temp = []
    each do |x|
      temp << yield(x)
    end
    return temp
  end

  def my_inject(result = nil)
    my_each_with_index do |x, idx|
      result = if result.nil? && idx.zero?
                 self[0]
               else
                 yield result, x
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
