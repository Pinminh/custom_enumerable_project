module Enumerable
  # Your code goes here
  def my_each_with_index
    for index in 0...self.length do
      yield self[index], index
    end
    self
  end

  def my_select
    selected = []
    for value in self do
      selected << value if yield value
    end
    selected
  end

  def my_all?
    for value in self do
      return false unless yield value
    end
    true
  end

  def my_any?
    for value in self do
      return true if yield value
    end
    false
  end

  def my_none?
    self.my_all? { |value| !yield(value) }
  end

  def my_count
    return self.length unless block_given?

    count = 0
    for value in self do
      count += 1 if yield value
    end

    count
  end

  def my_map
    mapped = []
    for value in self do
      mapped << yield(value)
    end
    mapped
  end

  def my_inject(initial_value = nil)
    accumulator = initial_value.nil? ? self.first : initial_value
    start_index = initial_value.nil? ? 1 : 0

    for index in start_index...self.length do
      accumulator = yield accumulator, self[index], index
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for value in self do
      yield value
    end
    self
  end
end
