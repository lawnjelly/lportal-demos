shader_type spatial;
//render_mode blend_mix;
render_mode unshaded;
//,depth_draw_opaque,cull_back;
//,diffuse_burley,specular_schlick_ggx;
uniform sampler2D texture_albedo : hint_albedo;
uniform sampler2D texture_lightmap : hint_albedo;



void fragment() {
	//vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,UV);
	vec4 lightmap_tex = texture(texture_lightmap,UV2);
	ALBEDO = albedo_tex.rgb * lightmap_tex.rgb * 2.0;
	//ALBEDO = albedo_tex.rgb  * 2.0;
}

