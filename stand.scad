// width: The width of the stand when looking from the front
// depth: The depth of the spot in which the stood object sits
// height: The height of the stand measured up the backrest
// angle: The angle that the stood object leans back
// base: The distance between the points of contact when the stand is leaned back
// join_height: The height at which the stand part intersects with the backrest
// lip: The height of the lip
// thickness: The thickness of all parts of the stand
module stand(width=50, depth=50, height=100, angle=15, base=75, join_height=100, lip=10, thickness=5) {
    linear_extrude(height = width, center = true)
    union() {
        // Backrest
        hull() {
            translate([height-thickness,0,0]) circle(thickness);
            translate([-thickness,0,0]) circle(thickness);
        }
        // Stand
        hull() {
            translate([join_height-thickness,0,0]) circle(thickness);
            translate([sin(angle) * base,cos(angle) * base,0]) circle(thickness);
        }
        // Holder
        hull() {
            translate([-thickness,-depth-thickness,0]) circle(thickness);
            translate([-thickness,0,0])circle(thickness);
        }
        // Lip
        hull() {
            translate([-thickness,-depth-thickness,0]) circle(thickness);
            translate([lip -thickness,-depth-thickness,0]) circle(thickness);
        }
    }
}
