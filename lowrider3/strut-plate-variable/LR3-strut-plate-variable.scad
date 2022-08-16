// Slightly modified version of Jamie's script intended to be called via 
// OpenSCAD's commandline based automation.

// Jamie's original script:
// - https://www.printables.com/model/206716-lr3-strut-plate-variable

// beam_len's default will be overidden by command line param-value.
beam_len = 790;

// Compute number of braces given specified beam length
// https://docs.v1engineering.com/lowrider/#strut-plates design requires...
//    "you want no more than 200mm (8”) between the braces"
// 
// But doc also has 2' design with 6 braces, when 5 would satisfy the 200mm
// requirement.  So, we'll add an additional brace for short gantry, until
// if/when this assumption is corrected/clarified.
num_braces = ceil(beam_len / 200) + ((beam_len < 800) ? 2 : 1);

echo(str("beam_len = ", beam_len));
echo(str("num_braces = ", num_braces));

num_keys = num_braces;


key_pitch = (beam_len - 15)/(num_keys-1);


difference() {
  square([beam_len, 80]);
  // cut out all keyholes (and notch at bottom)
  for (i=[0:num_keys-1]) keyhole(7.5 + key_pitch*i);
  
  // first and last truss (diagonal) boxes done outside loop
  translate([7.5, 0]) box_negative(left_trim=1.5);
  translate([7.5+(num_keys-2)*key_pitch, 0]) box_negative(left_trim=1.5, xflip=1);
  
  // all other boxes, left, right, or X
  for (i=[1:num_keys-3]) {
    translate([7.5+key_pitch*i, 0])
    if (i == num_keys/2-1) {
      box_negative(w=14);  // middle block has X with thinner struts
    }
    else if (i < num_keys/2-1) {
      box_negative();
    }
    else {
      box_negative(xflip=1);
    }
  }
}

module box_negative(left_trim=0, w=18, xflip=0) {
  translate([key_pitch*xflip, 0, 0]) mirror([xflip, 0, 0]) offset(r=4, $fn=30)
  intersection() {
    if (w < 18) {  // intersection has no effect if not doing skinny
      translate([0, 80, 0]) mirror([0, 1, 0]) pre_negative(left_trim, w);
    }
    pre_negative(left_trim, w);
  }
}

module pre_negative(left_trim, w, r = 4) {
  difference() {
    translate([9+left_trim+r, 18+r]) 
      square([key_pitch-18-left_trim-2*r, 80-2*18-2*r]);
    hull() {
      translate([0, 74]) circle(d=w+2*r, $fn=60);
      translate([key_pitch, 6]) circle(d=w+2*r, $fn=60);
    }
  }
}

module keyhole(xpos=7.5) {
  translate([xpos, 60.5]) {
    circle(d=9.84, $fn=60);
    hull() for (y=[0, 13.5]) translate([0, y]) circle(d=5.1, $fn=30);
  }
  hull() for (y=[-1, 6]) translate([xpos, y]) circle(d=5.1, $fn=30);
}

// for comparison against reference
// %import("../3rd_party/lowrider-3-cnc-model_files/Strut Plate 790mm.svg");