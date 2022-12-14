#version 400
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

#pragma vertex

layout (std140, push_constant) uniform buf
{
    mat4 mvp;
    uint ViewID;
} ubuf;

layout (location = 0) in vec3 Position;
layout (location = 1) in vec2 UV;
            
layout (location = 0) out vec2 oUV;            
out gl_PerVertex
{
    vec4 gl_Position;
};

void main()
{
    vec2 ouv = UV;
    if (ubuf.ViewID > 0) {
        ouv.x += 0.5f;
    }
    oUV = ouv;
    gl_Position = ubuf.mvp * vec4(Position, 1.0);
    gl_Position.y = -gl_Position.y;
}
