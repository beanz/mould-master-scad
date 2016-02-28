/*
 * openscad Sad Face chocolate master for silicone mould
 * Copyright 2016 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * This code requires an STL from:
 *
 *   http://www.thingiverse.com/thing:1350837
 *
 * by the awesome Loubie.
 */

use <../mould-master.scad>

module choc() {
  import("sad_face.STL"); // from http://www.thingiverse.com/thing:1350837
}

master() {
  choc();
  translate([44,0,0]) choc();
}
