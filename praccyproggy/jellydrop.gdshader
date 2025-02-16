shader_type canvas_item;
render_mode unshaded;

uniform vec4 dropcolor = vec4(.1, .1, .1, 1);
uniform vec2 shine_position = vec2(0.22, 0.22);
uniform float shine_size = .075;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float feather = .001;
uniform float ratio = 1.2046783626;
uniform float brightness = 1.0;
uniform float contrast = 1.0;

void vertex() {
  // Animate Sprite2D moving in big circle around its location
  //VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
}



//mix usage commented here potentially able to replace the currently rgb multiplier on texture.
//color is an output from vertex that is the texture of the sprite by default.
//input_color code is also functional but not currently neccisary but might be in the future so im leaving it in.
// later code is for progrommatic shine placement, uses a uv map mixed with the shine location to only change values within a fixed distance of the shine point.
//curently does not progromatically move shine so is depricated.

void fragment() {
	//vec4 input_color = texture(TEXTURE, UV);
	COLOR.r *= dropcolor.r;
	COLOR.g *= dropcolor.g;
	COLOR.b *= dropcolor.b;
	//input_color.rgb = mix(vec3(0.0), input_color.rgb, brightness);
	//input_color.rgb = mix(vec3(0.5), input_color.rgb, contrast);
	//input_color.rgb = mix(vec3(dot(vec3(1.0), input_color.rgb) * 0.33333), input_color.rgb, saturation);
	//COLOR.rgb = input_color.rgb;



	//vec2 pixel_size = 1.0 / vec2(textureSize(TEXTURE, 0));
    //vec2 pixel_off = vec2(0, 20.0);
	//float offset;
	//vec2 temp_shine = vec2(0.0, 0.0);
	//vec4 tex = texture(TEXTURE, UV + pixel_off * pixel_size);
	//float uvx = UV.x * sin(UV.y) * 3.3;
	//vec2 uv_shine = vec2(mix(shine_position.x, uvx, ratio), UV.y * .85);
	//temp_shine += shine_position;
	//if(tex.a != 0.0)
	//{
		//
		//temp_shine *= VERTEX;
	//}
	//float dist = distance(temp_shine, uv_shine);
	////COLOR.a = 1.0;
	//COLOR *= min(abs(smoothstep(shine_size - feather, shine_size + feather, dist) - 1.3), 1.0);
	//COLOR = vec4(tex.r, tex.g, tex.b, tex.a);
    }



//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
