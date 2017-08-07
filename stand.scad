//CUSTOMIZER VARIABLES

// The width of the stand when looking from the front
stand_width = 50;

// The depth of the spot in which the stood object sits
bottom_depth = 50;

// The height of the stand measured up the backrest
backrest_height = 150;

// The angle that the stood object leans back
lean_angle = 20;

// The distance between the points of contact when the stand is leaned back
base_distance = 100;

// The height at which the stand part intersects with the backrest
join_height = 100;

// The height of the lip
lip_height = 10;

// The thickness of all parts of the stand
structure_thickness = 15;

//CUSTOMIZER VARIABLES END

module stand(width=stand_width, depth=bottom_depth, height=backrest_height, angle=lean_angle, base=base_distance, join=join_height, lip=lip_height, thickness=structure_thickness) {
    linear_extrude(height = width, center = true)
    union() {
        // Backrest
        hull() {
            translate([height-(thickness/2),(thickness/2),0]) circle(d=thickness);
            translate([-(thickness/2),(thickness/2),0]) circle(d=thickness);
        }
        // Stand
        hull() {
            translate([join-(thickness/2),(thickness/2),0]) circle(d=thickness);
            translate([max(join-thickness, -thickness/2),(thickness/2),0]) circle(d=thickness);
            translate([sin(angle) * base - (thickness/2),cos(angle) * base + (thickness/2),0]) circle(d=thickness);
        }
        // Holder
        hull() {
            translate([-(thickness/2),-depth-(thickness/2),0]) circle(d=thickness);
            translate([-(thickness/2),(thickness/2),0])circle(d=thickness);
        }
        // Lip
        hull() {
            translate([-(thickness/2),-depth-(thickness/2),0]) circle(d=thickness);
            translate([lip -(thickness/2),-depth-(thickness/2),0]) circle(d=thickness);
        }
    }
}

stand();
