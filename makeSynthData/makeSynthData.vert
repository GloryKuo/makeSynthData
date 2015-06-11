#version 330

layout (std140) uniform Lights {
    vec4 l_pos;
};
 
in vec4 position;
in vec3 normal;
 
out Data {
    vec3 normal;
    vec3 eye;
    vec3 lightDir;
} DataOut;
 
void main () {
 
    vec4 pos = gl_ModelViewMatrix * position;
 
    DataOut.normal = normalize(gl_NormalMatrix * normal);
    DataOut.lightDir = vec3(l_pos - pos);
    DataOut.eye = vec3(-pos);
 
    gl_Position = gl_ModelViewProjectionMatrix * position; 
}