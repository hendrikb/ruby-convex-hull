require_relative './point.rb'
require_relative './edge.rb'
require 'set'
require 'csv'


module Geometry
  class ConvexHull
    def self.compute points, be_verbose = false
      start_time = DateTime.now
      all_sorted_points = points.sort {|a,b| a.x <=> b.x}
      polygon_hull = compute_edge_hull all_sorted_points, be_verbose

      set = Array.new
      polygon_hull.each do |edge|
        set.push edge.p1 unless set.include? edge.p1
        set.push edge.p2 unless set.include? edge.p2
      end
      end_time = DateTime.now

      calc_time(start_time, end_time) if be_verbose

      return set
    end

    private
    # basic algorithm,
    # details here: http://www-m9.ma.tum.de/foswiki/pub/WS2009/AlgorithmischeGeometrie/FolienVAlgGeomV2.pdf
    def self.compute_edge_hull points, be_verbose = false
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

    def self.calc_time start_time, end_time
      start_ms = start_time.strftime("%Q").to_i
      end_ms = end_time.strftime("%Q").to_i
      duration_ms = end_ms - start_ms

      if duration_ms > 2000
        duration = (duration_ms / 1000.to_f).round(3)
        time_unit = "seconds"
      else
        duration = duration_ms
        time_unit = "microseconds"
      end

      puts "Hull Calculation took #{duration} #{time_unit}"
    end
  end
end




