module Geometry
  class Point
    attr_accessor :x,:y
    def initialize x,y
      self.x=x
      self.y=y
    end

    def left_of? p,q
      r = self
      determinant = p.x * q.y + r.x*p.y + q.x*r.y - q.x*p.y - r.x*q.y - p.x*r.y

      return true if determinant >= 0
      return false
    end

    def to_s
      "(#{x}:#{y})"
    end
  end
end
