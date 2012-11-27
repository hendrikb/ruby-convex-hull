module Geometry
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
end
