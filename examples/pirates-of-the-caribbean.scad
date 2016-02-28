/*
 * openscad pirates of the caribbean chocolate master for silicone mould
 * Copyright 2016 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * This code requires an STL from:
 *
 *   http://www.thingiverse.com/thing:31536
 *
 * by Bill.
 */

use <../mould-master.scad>

module choc() {
  render() translate([0,0,-1.5]) {
    difference() {
      import("potcc-2-skull.stl");
      cube([1000,1000,3], center = true);
    }
  }
}

master() choc();
