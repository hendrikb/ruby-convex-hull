
def load_example_points
  [
    Geometry::Point.new(141,2),
    Geometry::Point.new(396,417),
    Geometry::Point.new(171,250),
    Geometry::Point.new(277,352),
    Geometry::Point.new(151,257),
    Geometry::Point.new(80,478),
    Geometry::Point.new(222,256),
    Geometry::Point.new(100,69),
    Geometry::Point.new(2,404),
    Geometry::Point.new(332,315)
  ]
end

def load_csv_example_points
  points = Array.new
  CSV.foreach("./random_numbers.csv", col_sep: ";", headers: true) do |row|
    points.push Geometry::Point.new(row[1].to_i, row[2].to_i)
  end
  points
end

def p x,y
  Geometry::Point.new(x,y)
end
