require 'pry'

class Triangle

  attr_reader :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    validate_triangle
    if length1 == length2 && length2 == length3
      :equilateral
    elsif length1 == length2 || length2 == length3 || length1 == length3
      :isosceles
    else 
      :scalene
    end
  end
  
  def no_size?
    [length1, length2, length3].all?(&:positive?)
  end 

  def triangle_inequality?
    length1 + length2 > length3 && length1 + length3 > length2 && length2 + length3 > length1
  end

  def validate_triangle
    raise TriangleError unless no_size? && triangle_inequality?
  end

    
  class TriangleError < StandardError
  end

end
