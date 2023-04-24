#version 450

layout(location = 0) out vec3 fragColor;

vec2 positions[3] = vec2[3]( // An array of 3 vec2 objects
    vec2( 0.00, -0.50),
    vec2 (0.50,  0.50),
    vec2(-0.50,  0.50)
);

vec3 colors[3] = vec3[3](   // An array of 3 vec3 objects
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);

void main() {   
    gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}
