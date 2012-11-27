ruby-convex-hull
================

Usage
+++++

See example.rb for example library usage.

Run the example by calling `ruby example.rb`

Programming
+++++++++++

The source code is given in library style. Be sure to add `require lib/convex_hull`
to your script.

Call the convex hull calculation using the following syntax:
`Geometry::ConvexHull.perform ( array_of_points, false )`

What you will get is an array (subset of array_of_points) of points that
represent the complex hull of array_of_points.

You need to fill the given `array_of_points` with instances of the
`Geometry::Point` object.

You have `be_verbose` as second parameter. Set it to true to enable a very
talkative algorithm. Set it to false to **only** have the algorithm provide you
an array (which you probably cannot see because you're not `puts` it)

Again, see the `example.rb` for details on how to call the stuff using given
arrays, points from CSV-files and such.

Note
++++

This implementation is naive. It is working straight forward, literally brute forcing the
solution. It's not what you call a decent [Convex Hull Algorithm](http://en.wikipedia.org/wiki/Convex_hull_algorithms "English Wikipedia: Convex Hull Algorithms").

If you want to, you can fork and implement one of those things. I did not have
the time, as this was only a one-shot homework for me.

TL;DR
+++++

A convex hull calculation implementation in ruby (it was a homework).
