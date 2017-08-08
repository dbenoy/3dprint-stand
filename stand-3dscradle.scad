use <stand.scad>

// Stand when combined with the 3DS charging cradle so the console is propped at the same angle as stand-ndslite.scad

union() {
    stand(
        width=15,
        depth=15,
        height=74,
        angle=35 + 8.5,
        base=50,
        join=50,
        lip=3,
        thickness=4
    );
    linear_extrude(height = 15, center = true)
    hull() {
        translate([-2,-15-2,0]) circle(d=4);
        translate([-2,2,0])circle(d=4);        
        translate([1,0,0])circle(d=4);        
    }
}