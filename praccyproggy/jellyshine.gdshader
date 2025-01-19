shader_type canvas_item;

uniform vec4 dropcolor = vec4(1, 1, .984, 1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	input_color.r = input_color.r * dropcolor.r;
	input_color.g = input_color.g * dropcolor.g;
	input_color.b = input_color.b * dropcolor.b;
	COLOR = input_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
