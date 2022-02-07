# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f
  end

  def median
    return nil if self.empty?
    middle = self.length/2
    if self.length.odd?
        return self.sort[middle]
    else
        return self.sort[middle-1..middle].average
    end
  end

  def counts
    hash = Hash.new(0)
    self.each do |el| hash[el] += 1 end
    hash
  end

  def my_count(value)
    count = 0
    self.each do |el| count += 1 if el == value end
    count
  end

  def my_index(value)
    return nil if !self.include?(value)
    self.each_with_index do |el,i| return i if el == value end
  end

  def my_uniq
    uniq = []
    self.each do |el|
        uniq << el if !uniq.include?(el)
    end
    uniq
  end

  def my_transpose
    new_a = Array.new(self.length) {Array.new(self.length)}
    (0...self.length).each do |row|
        (0...self.length).each do |column|
            new_a[column][row] = self[row][column]
        end
    end
    new_a
  end
end
