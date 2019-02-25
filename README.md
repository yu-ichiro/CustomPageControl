CustomPageControl
===
Flexibility + UIControl


## OverView
CustomPageControl is a subclass of UIPageControl that has an array to hold custom images for the page indicators.

Just like UITabbars and UIToolbars, CustomPageCotrol makes a mask from a image and replace it with the plain grey circle.


You can set tintColors and CustomPageControl will use it to draw the mask in the right color.

You can even set several different images for any index

## Usage

Include the .swift file in your project, and you're done!


## Issues

I've never touched drawRect() and CGContextDrawImage()s before, so it currently works, but I dont quite know what's going on inside ;)

When you set currentIndex, you will need to use updateIndex() in order to update the graphics
Plus, there's some dirty maneuvers that I didn't want to use, but I didn't know any other way to do it

## Fixing Greatly Welcomed!

Please don't hesitate sending me a pull-req or a issue! Any participation in developing welcomed!

