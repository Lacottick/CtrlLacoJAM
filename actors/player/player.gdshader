shader_type canvas_item;

uniform sampler2D normal_map : hint_normal;

void fragment() {
    // Get the base color
    vec4 color = texture(TEXTURE, UV);
    
    // Apply normal map for lighting
    NORMAL = texture(normal_map, UV).rgb;
    
    COLOR = color;
}
