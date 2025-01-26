shader_type canvas_item;

uniform vec4 dropcolor = vec4(0.847, 0.773, 0.38, 1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR.r *= dropcolor.r;
	COLOR.g *= dropcolor.g;
	COLOR.b *= dropcolor.b;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
