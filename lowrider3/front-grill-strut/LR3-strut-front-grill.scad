//       1         2         3         4         5         6   
// 456789012345678901234567890123456789012345678901234567890123456789

// V1E LowRider 3 mod - Custom Front Grill (strut)
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

// Based on Jamie's script:
// - https://www.printables.com/model/206716-lr3-strut-plate-variable

// Usage:
// 1) Edit beam_len, set to match your LR3's EMT Rail length.  Use 
//    https://docs.v1engineering.com/lowrider/calculator/ to figure
//    out "Tube Length" (and other dimensions) for your build.
//    - For example 4' (1220mm) usable cutting width requires 
//      55" = 1400mm tube length for the gantry.

// 2) Edit num_keys, set to number of beam braces, which should be 
//    spaced, ideally, no more than 8" (203mm) a part.  
//    
//    Intentionally did not automatically compute num_keys because you
//    might want to deviate from the ideal max spacing, within reason, 
//    as you balance aesthetics against optimal strength.
// 3) Render and export in .svg/.dxf format
// 4) Open in EstlCam or which ever CNC gcode generating software you 
//    use. Cut...


// 1440mm = 56.5" tube rail for cutting width of 49.5" (MDF + 1/2" wiggle)
beam_len = 1440; 
num_keys = 8;

// 2' x 4' Usable Cutting Area  
//beam_len = 790;
//num_keys = 6;

cnc_name = 
  //"Aza's Lowrider 3";
  "Milly McMillFace";

cnc_name_font =
    //"Roboto:style=Condensed"; // Download from https://www.dafont.com/roboto.font
    "Nasalization";           // Download from https://www.dafont.com/nasalization.font


cnc_name_fudge = 0; // Ideally 0, but play with your fudge factor until things feel right.

marker_font = 
    "Roboto:style=Condensed"; // Download from https://www.dafont.com/roboto.font
font_spacing = 0.95;
font_size = 14;
increment_font_size = 13.9;
increment_font_spacing = 0.9;
fontTopPos = 75;
strut_height = 80;
zone_height = 30;
zone_padding = 11;
bit_diameter = 3.175;


// Computed variables
strike_spacing = bit_diameter * 3;
fontLineHeight = font_size + 3;
key_pitch = (beam_len - 15)/(num_keys-1);


// Neat array of character width proportions.  Based on work by (A), generated using (B).
// (A) https://www.thingiverse.com/groups/openscad/forums/general/topic:54084
// (B) https://codepen.io/amatulic/pen/eYeBLva
// Nasalization width proportions
fontWidthProportions = [
  0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.26699981689453123, 0.26699981689453123, 0.26699981689453123, 0.26699981689453123, 0.26699981689453123, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.26699981689453123, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.26699981689453123, 0.2339996337890625, 0.3819999694824219, 0.6229995727539063, 0.6199996948242188, 0.8449996948242188, 0.7649993896484375, 0.19399948120117189, 0.3939994812011719, 0.3939994812011719, 0.5579994201660157, 0.6189994812011719, 0.2569999694824219, 0.4149993896484375, 0.24199981689453126, 0.4549995422363281, 0.7479995727539063, 0.33699951171875, 0.7339996337890625, 0.680999755859375, 0.7039993286132813, 0.6849998474121094, 0.7129997253417969, 0.6509994506835938, 0.7259994506835937, 0.7129997253417969, 0.2719993591308594, 0.2719993591308594, 0.6189994812011719, 0.6189994812011719, 0.6189994812011719, 0.5689994812011718, 0.7659996032714844, 0.7839996337890625, 0.7189994812011719, 0.6819999694824219, 0.73699951171875, 0.692999267578125, 0.6629997253417969, 0.7289993286132812, 0.7449996948242188, 0.280999755859375, 0.5829994201660156, 0.7079994201660156, 0.6219993591308594, 1.162999725341797, 0.8789993286132812, 0.8159996032714844, 0.6789993286132813, 0.8159996032714844, 0.7139999389648437, 0.7029998779296875, 0.5709999084472657, 0.7319999694824219, 0.7839996337890625, 1.162999725341797, 0.780999755859375, 0.6889999389648438, 0.742999267578125, 0.3939994812011719, 0.4549995422363281, 0.3939994812011719, 0.5349998474121094, 0.5139999389648438, 0.34399948120117185, 0.6719993591308594, 0.6949996948242188, 0.6019996643066406, 0.6949996948242188, 0.6519996643066406, 0.375, 0.6919998168945313, 0.7069999694824218, 0.2579994201660156, 0.26999969482421876, 0.6019996643066406, 0.2579994201660156, 1.0319999694824218, 0.7069999694824218, 0.6709999084472656, 0.692999267578125, 0.692999267578125, 0.4629997253417969, 0.5859992980957032, 0.375, 0.7019996643066406, 0.6769996643066406, 0.9769996643066406, 0.680999755859375, 0.6469993591308594, 0.6239997863769531, 0.3939994812011719, 0.28899993896484377, 0.3939994812011719, 0.6189994812011719, 0.5, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.7259994506835937, 0.26699981689453123, 0.2339996337890625, 0.6199996948242188, 0.65, 0.6569999694824219, 0.6889999389648438, 0.28899993896484377, 0.6629997253417969, 0.45799942016601564, 0.8159996032714844, 0.4739997863769531, 0.41999969482421873, 0.6189994812011719, 0, 0.8159996032714844, 0.5729995727539062, 0.38899993896484375, 0.6189994812011719, 0.3939994812011719, 0.3939994812011719, 0.34399948120117185, 0.576171875, 0.7329994201660156, 0.24199981689453126, 0.2689994812011719, 0.3939994812011719, 0.47899932861328126, 0.41999969482421873, 0.8649993896484375, 0.8649993896484375, 0.8649993896484375, 0.5689994812011718, 0.7839996337890625, 0.7839996337890625, 0.7839996337890625, 0.7839996337890625, 0.7839996337890625, 0.7839996337890625, 1.0099998474121095, 0.6819999694824219, 0.692999267578125, 0.692999267578125, 0.692999267578125, 0.692999267578125, 0.292999267578125, 0.29499969482421873, 0.3579994201660156, 0.317999267578125, 0.73699951171875, 0.8789993286132812, 0.8159996032714844, 0.8159996032714844, 0.8159996032714844, 0.8159996032714844, 0.8159996032714844, 0.6189994812011719, 0.8159996032714844, 0.7319999694824219, 0.7319999694824219, 0.7319999694824219, 0.7319999694824219, 0.6889999389648438, 0.7029998779296875, 0.8539993286132812, 0.6719993591308594, 0.6719993591308594, 0.6719993591308594, 0.6719993591308594, 0.6719993591308594, 0.6719993591308594, 1.0829994201660156, 0.6019996643066406, 0.6519996643066406, 0.6519996643066406, 0.6519996643066406, 0.6519996643066406, 0.2779998779296875, 0.27699966430664064, 0.36399993896484373, 0.34599990844726564, 0.6949996948242188, 0.7069999694824218, 0.6709999084472656, 0.6709999084472656, 0.6709999084472656, 0.6709999084472656, 0.6709999084472656, 0.6189994812011719, 0.6709999084472656, 0.7019996643066406, 0.7019996643066406, 0.7019996643066406, 0.7019996643066406, 0.6469993591308594, 0.6949996948242188, 0.6469993591308594
];

// // Roboto width proportions
// fontWidthProportions = [
//   0, 0, 0.443359375, 0, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.24755859375, 0.24755859375, 0.24755859375, 0.24755859375, 0.24755859375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.24755859375, 0.25732421875, 0.31982421875, 0.61572265625, 0.5615234375, 0.732421875, 0.62158203125, 0.17431640625, 0.341796875, 0.34765625, 0.4306640625, 0.56689453125, 0.1962890625, 0.27587890625, 0.26318359375, 0.412109375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.5615234375, 0.2421875, 0.21142578125, 0.50830078125, 0.548828125, 0.5224609375, 0.47216796875, 0.89794921875, 0.65234375, 0.62255859375, 0.65087890625, 0.65576171875, 0.568359375, 0.552734375, 0.68115234375, 0.712890625, 0.27197265625, 0.5517578125, 0.626953125, 0.5380859375, 0.873046875, 0.712890625, 0.6875, 0.630859375, 0.6875, 0.61572265625, 0.59326171875, 0.5966796875, 0.6484375, 0.63623046875, 0.88720703125, 0.626953125, 0.6005859375, 0.5986328125, 0.26513671875, 0.41015625, 0.26513671875, 0.41796875, 0.451171875, 0.30908203125, 0.5439453125, 0.56103515625, 0.5234375, 0.56396484375, 0.52978515625, 0.34716796875, 0.56103515625, 0.55078125, 0.24267578125, 0.23876953125, 0.5068359375, 0.24267578125, 0.87646484375, 0.5517578125, 0.5703125, 0.56103515625, 0.568359375, 0.33837890625, 0.515625, 0.32666015625, 0.55126953125, 0.484375, 0.75146484375, 0.49560546875, 0.47314453125, 0.49560546875, 0.33837890625, 0.24365234375, 0.33837890625, 0.68017578125, 0.5, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.443359375, 0.24755859375, 0.24365234375, 0.546875, 0.5810546875, 0.712890625, 0.52490234375, 0.23974609375, 0.61328125, 0.41796875, 0.78564453125, 0.44677734375, 0.46923828125, 0.5537109375, 0, 0.7861328125, 0.4580078125, 0.37353515625, 0.5341796875, 0.36669921875, 0.36669921875, 0.3134765625, 0.56640625, 0.48876953125, 0.2607421875, 0, 0.36669921875, 0.45458984375, 0.46875, 0.732421875, 0.77587890625, 0.77783203125, 0.47314453125, 0.65234375, 0.65234375, 0.65234375, 0.65234375, 0.65234375, 0.65234375, 0.9345703125, 0.65087890625, 0.568359375, 0.568359375, 0.568359375, 0.568359375, 0.27197265625, 0.27197265625, 0.27197265625, 0.27197265625, 0.67041015625, 0.712890625, 0.6875, 0.6875, 0.6875, 0.6875, 0.6875, 0.533203125, 0.6875, 0.6484375, 0.6484375, 0.6484375, 0.6484375, 0.6005859375, 0.5908203125, 0.5947265625, 0.5439453125, 0.5439453125, 0.5439453125, 0.5439453125, 0.5439453125, 0.5439453125, 0.84423828125, 0.5234375, 0.52978515625, 0.52978515625, 0.52978515625, 0.52978515625, 0.2470703125, 0.2470703125, 0.2470703125, 0.2470703125, 0.5859375, 0.5517578125, 0.5703125, 0.5703125, 0.5703125, 0.5703125, 0.5703125, 0.57080078125, 0.56640625, 0.55126953125, 0.55126953125, 0.55126953125, 0.55126953125, 0.47314453125, 0.576171875, 0.47314453125
// ];

function calcTextWidth(s, i=0, ret=0) = i<len(s) ? calcTextWidth(s, i+1, ret + fontWidthProportions[ord(s[i])] * font_size) : ret;

totalCharWidth = calcTextWidth(cnc_name);

difference() {
  square([beam_len, strut_height]);
  
  // cut out all keyholes (and notch at bottom)
  for (i=[0:num_keys-1]) keyhole(7.5 + key_pitch*i);

  // V1E Logo
  translate([31 + key_pitch, 57])
  scale([0.8,0.8])
    import("v1e/v1e.svg");

  echo(str("totalCharWidth ", totalCharWidth));
  
  // Your LR3's name
  translate([((key_pitch - totalCharWidth) / 2) + (key_pitch * 2) + cnc_name_fudge, 74])
    text(
      cnc_name,
      font = cnc_name_font,
      valign = "top",
      size = font_size,
      spacing = font_spacing);

  // 100mm increment markers
  for (i=[0:100:beam_len - 180]) {
    y = (i < 10) ? (fontTopPos - (3 * fontLineHeight))
      : (i < 100) ? (fontTopPos - (2 * fontLineHeight))
      : (i < 1000) ? (fontTopPos - fontLineHeight)
      : fontTopPos;
    translate([i + 90, y])
      text(
        str(i),
        font = marker_font,
        direction = "btt",
        size = increment_font_size,
        spacing = increment_font_spacing);
  }

  // Last usable marker
  {
    lastNum = beam_len - (90 * 2);
    y = (lastNum < 10) ? (fontTopPos - (3 * fontLineHeight))
      : (lastNum < 100) ? (fontTopPos - (2 * fontLineHeight))
      : (lastNum < 1000) ? (fontTopPos - fontLineHeight)
      : fontTopPos;
    translate([lastNum + 90, y])
      text(
        str(lastNum),
        font = marker_font,
        direction = "btt",
        size = increment_font_size,
        spacing = increment_font_spacing);
  }

  // Draw 50mm increment notches
  // Positioned as close to edge as possible without being considered part of the Strut's exterior contour
  for (i=[0:50:beam_len - 180])
    translate([i + 90, bit_diameter / 2])
      hull() for (y=[0, 2]) translate([0, y]) circle(d= 3.175, $fn=10);
      
  // Last Notch
  translate([beam_len - 90, bit_diameter / 2])
      hull() for (y=[0, 2]) translate([0, y]) circle(d= 3.175, $fn=10);

  // Left NOT Usable Zone
  // TODO: Simplify this fugly abomination
  for (i=[zone_padding:strike_spacing:90 - bit_diameter]) {
    translate([i, 5]) hull() {
      for (y=[0, zone_height]) {
        tx = (i-y < zone_padding) ? -i + zone_padding : -y;
        ty = (i-y < zone_padding) ? y + i - (zone_padding + zone_height) : y;
        
        // Don't mark NOT GO Zone near outer contour's fastener notch
        if (tx != -i + zone_padding || ty > 5) {
          translate([tx, ty]) circle(d=bit_diameter, $fn=10);
        }
      }
    }
  }

  // Right NOT Usable Zone
  for (i=[bit_diameter:strike_spacing:90 - zone_padding]) {
    translate([beam_len - 90 + i, 5]) hull() {
      for (y=[0, zone_height]) {
        tx = (i + y > 90 - zone_padding) ? -i + 90 - zone_padding : y;
        ty = (i + y > 90 - zone_padding) ? -(y + i - (90 - zone_padding + zone_height)) : y;

        if (tx != -i + 90 - zone_padding || ty > 5) {
          translate([tx, ty]) circle(d=bit_diameter, $fn=10);
        }
      }
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

// For comparison against reference
// translate([0,100]) import("v1e/Strut Plate 1400mm.dxf");
