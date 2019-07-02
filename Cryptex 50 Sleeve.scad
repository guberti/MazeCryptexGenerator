dimensions = [60, 50];
options = dimensions[1];
radius = 20;
slice_height = (radius * 2 * PI)/dimensions[1];
echo(slice_height);
ang = 360/options;
wall_radius = radius + slice_height;
echo(wall_radius*2);
IN_MM_CONVERSION = 25.4;
pvc_outer_radius = ((2.375)/2 * IN_MM_CONVERSION);
pvc_inner_radius = ((2.047)/2 * IN_MM_CONVERSION);
handle_radius = pvc_outer_radius + slice_height + 1;
bottom_thickness = 5;


cylinder(h=bottom_thickness, r=handle_radius, $fn=12);
difference () {
    translate([0, 0, bottom_thickness])
    cylinder(h=slice_height*(dimensions[0] + 0.5), r=pvc_inner_radius-.4);

    translate([0, 0, bottom_thickness])
    cylinder(h=slice_height*(dimensions[0] + 0.5),r=wall_radius+.4,$fn=208);
}
echo(slice_height*(dimensions[0] + 0.5)*2);
translate([21.2, 0, bottom_thickness+slice_height*(dimensions[0] - 1)]) // Account for bottom ring
rotate([0, 90, 0])
cylinder(r=1,h=2,$fn=208);
