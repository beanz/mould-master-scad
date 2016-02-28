/*
 * openscad So Make It chocolate master for silicone mould
 * Copyright 2016 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 */

use <../mould-master.scad>

thickness = 2; // thickness used for base and logo so total is thickness x 2
size = 30; // length of side of chocolate
corner_radius = 6; // roundness of corners
$fn = 30; // make corners smoother

// render a mould master with two chocolates next to each other
master() chocs();

// a mould shape for debugging
%translate([0, -10, 6]) {
  rotate([180, 0, 0]) mould() chocs();
}

// two chocolates next to each other
module chocs() {
  choc();
  translate([size+4, 0, 0]) choc();
}

// choc() is a base with the So Make It logo on top
module choc() {
  translate([0, 0, (thickness+0.01)/2]) {
    hull() {
      translate([corner_radius, corner_radius, 0])
        cylinder(r = corner_radius, h = thickness+0.01, center = true);
      translate([size-corner_radius, corner_radius, 0])
        cylinder(r = corner_radius, h = thickness+0.01, center = true);
      translate([size-corner_radius, size-corner_radius, 0])
        cylinder(r = corner_radius, h = thickness+0.01, center = true);
      translate([corner_radius, size-corner_radius, 0])
        cylinder(r = corner_radius, h = thickness+0.01, center = true);
    }
    translate([0,0,thickness]) {
      logo();
    }
  }
}

// logo() is the So Make It logo
module logo() {
  difference() {
    hull() {
      translate([corner_radius, corner_radius, 0])
        cylinder(r = corner_radius, h = thickness, center = true);
      translate([size-corner_radius, corner_radius, 0])
        cylinder(r = corner_radius, h = thickness, center = true);
      translate([size-corner_radius, size-corner_radius, 0])
        cylinder(r = corner_radius, h = thickness, center = true);
      translate([corner_radius, size-corner_radius, 0])
        cylinder(r = corner_radius, h = thickness, center = true);
    }
    translate([size/2, size/2.3, 0]) {
      difference() {
        rotate([0,0,22.5])
          cylinder(r = size/3, h = thickness+2, center = true, $fn = 8);
        translate([0,-(1+size/6),-1])
          cube([size/4, 1+size/3, thickness+3], center = true);
        rotate([0,0,22.5])
          cylinder(r = 1.08*size/8, h = thickness+3, $fn = 8, center = true);
      }
      translate([0,size/3,-1])
        cube([size/4, size/4, thickness+3], center = true);
    }
  }
}
