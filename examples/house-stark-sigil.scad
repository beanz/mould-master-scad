/*
 * openscad House Stark sigil chocolate master for silicone mould
 * Copyright 2016 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * This code requires an STL from:
 *
 *   http://www.thingiverse.com/thing:939535
 *
 * by Blake Barnham.
 */

use <../mould-master.scad>

module choc() {
  translate([-200, -60, 0]) import("house-stark-sigil.stl");
}

master() choc();
