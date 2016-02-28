/*
 * openscad mockingjay chocolate master for silicone mould
 * Copyright 2016 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * This code requires an STL from:
 *
 *   http://www.thingiverse.com/thing:536307
 *
 * by Sharky.
 */

use <../mould-master.scad>

module choc() {
  import("mockingjay_standard_public.stl");
}

master() choc();
