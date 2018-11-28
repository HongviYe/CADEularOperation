#version 330 core
uniform mat4 matrix;
in vec4 vPosition;
in vec4 vColor;
in vec4 vColor2;
out vec4 fColor;
uniform int useColor=0;
void main(void)
{
    if(useColor==0)
        fColor =  vColor2;//vec4(1.0f,0.0f,0.0f,1.0f);
    else
        fColor =  vColor;
    gl_Position = matrix * vPosition;
}
