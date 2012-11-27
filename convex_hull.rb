require './point.rb'
require 'pry'
require 'set'

class ConvexHull
  def compute points=load_example_points
    all_sorted_points = points.sort {|a,b| a.x <=> b.x}
    compute_hull all_sorted_points
  end

  private
  def compute_hull points
    return points if points.count <= 3

    hull = Array.new

    points.permutation(2).each do |p_q|
      edge = Edge.new(p_q[0], p_q[1])
      puts "checking: #{edge}"
      lot_passed = true
      points.each do |r|
        lot_passed = false unless r.left_of? edge.p1, edge.p2
      end
      hull.push(edge) if lot_passed and not hull.include? edge
    end

    return hull

  end

  def load_example_points
    [
      Point.new(141,2),
      Point.new(396,417),
      Point.new(171,250),
      Point.new(277,352),
      Point.new(151,257),
      Point.new(80,478),
      Point.new(222,256),
      Point.new(100,69),
      Point.new(2,404),
      Point.new(332,315)
    ]
  end
end

def p x,y
  Point.new(x,y)
end

class Edge
  attr_accessor :p1,:p2
  def initialize p1,p2
    self.p1 = p1
    self.p2 = p2
  end
  def to_s
    "#{p1}-#{p2}"
  end
end

c = ConvexHull.new
puts  c.compute [ p(1,1), p(2,1), p(3,5), p(4,3), p(7,3)  ]
