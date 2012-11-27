require './point.rb'
require './edge.rb'
require 'pry'
require 'set'

class ConvexHull
  def compute points=load_example_points, be_verbose = false
    all_sorted_points = points.sort {|a,b| a.x <=> b.x}
    compute_edge_hull all_sorted_points, be_verbose
  end

  private
  # basic algorithm,
  # details here: http://www-m9.ma.tum.de/foswiki/pub/WS2009/AlgorithmischeGeometrie/FolienVAlgGeomV2.pdf
  def compute_edge_hull points, be_verbose = false
    return [ Edge.new(points.first, points.last)] if points.count <= 2
    return [
      Edge.new(points.first, points.last),
      Edge.new(points.first, points[1]),
      Edge.new(points[1], points.last)
    ] if points.count == 3
    hull = Array.new

    points.permutation(2).each do |p_q|
      edge = Edge.new(p_q[0], p_q[1])
      lot_passed = true
      points.each do |r|
        lot_passed = false unless r.left_of? edge.p1, edge.p2
      end
      if lot_passed and not hull.include? edge
        hull.push(edge)
        puts "#{edge} is a hull edge" if be_verbose
      end


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


c = ConvexHull.new
c.compute [ p(1,1), p(2,1), p(3,5), p(4,3), p(7,3)], true
