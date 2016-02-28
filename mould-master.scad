/*
 * openscad mould/master library
 * Copyright 2016 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 */

epsilon = 0.005; // make this too small and rounding breaks height_helper()

module master(master_thickness = 1.5, mould_thickness = 2) {
  translate([0, 0, master_thickness]) {
    children();
  }
  difference() {
    outer(master_thickness, mould_thickness) children();
    translate([0, 0, master_thickness]) {
      inner(master_thickness, mould_thickness) children();
    }
  }
}

module mould(master_thickness = 1.5, mould_thickness = 2) {
  difference() {
    inner(master_thickness, mould_thickness) children();
    translate([0, 0, -epsilon]) children();
  }
}

module outer(master_thickness = 1.5, mould_thickness = 2) {
  minkowski() {
    height_helper() children();
    linear_extrude(height = master_thickness+mould_thickness) {
      offset(r = master_thickness+mould_thickness) projection() children();
    }
  }
}

module inner(master_thickness = 1.5, mould_thickness = 2) {
  minkowski() {
    height_helper() children();
    linear_extrude(height = mould_thickness + epsilon) {
      offset(r = -master_thickness) {
        offset(r = master_thickness+mould_thickness) {
          projection() children();
        }
      }
    }
  }
}

/*
 * height_helper() produces a cube([epsilon, epsilon, height-of-child]);
 * centered in x and y at the origin. The default epsilon is 0.001. The
 * height of the child is worked out by using projections of the first
 * child object.
 */
module height_helper() {
  translate([-epsilon/2, -epsilon/2, 0]) {
    rotate([-90,0,0]) {
      linear_extrude(height = epsilon) {
        projection() {
          rotate([0,-90,0]) {
            linear_extrude(height = epsilon) {
              projection() {
                rotate([90,0,0]) children();
              }
            }
          }
        }
      }
    }
  }
}
