// https://github.com/libretro/glsl-shaders/blob/master/nnedi3/shaders/jinc2-cshift-rgb.glsl
// https://github.com/libretro/common-shaders/blob/master/nedi/shaders/nedi-jinc.cg
// https://cemuhook.sshnuke.net/sampleResizers.zip
/*
   Hyllian's jinc windowed-jinc 2-lobe with anti-ringing Shader
   
   Copyright (C) 2011-2016 Hyllian - sergiogdb@gmail.com

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.

*/

#version 420

in vec2 passUV;
layout(binding=0) uniform sampler2D textureSrc;
uniform vec2 textureSrcResolution;
layout(location = 0) out vec4 colorOut0;

/*
   This is an approximation of Jinc(x)*Jinc(x*r1/r2) for x < 2.5,
   where r1 and r2 are the first two zeros of jinc function.
   For a jinc 2-lobe best approximation, use A=0.5 and B=0.825.
*/  

// #define halfpi  1.5707963267948966192313216916398 // not used?
#define pi    3.1415926535897932384626433832795
#define wa    ($Window_Sinc*pi)
#define wb    ($SINC*pi)


float resampler(vec2 pt1, vec2 pt2)
{
	vec2 v = pt2 - pt1;
	float d = sqrt(dot(v,v)); // Calculates the distance between two points

	return (d==0.0) ?  wa*wb  :  sin(d*wa)*sin(d*wb)/(d*d);
}

vec3 min4(vec3 a, vec3 b, vec3 c, vec3 d)
{
    return min(a, min(b, min(c, d)));
}

vec3 max4(vec3 a, vec3 b, vec3 c, vec3 d)
{
    return max(a, max(b, max(c, d)));
}

vec4 JINC2_sharp(vec2 texture_size, vec2 texCoord)
{
	vec3 color;
	mat4x4 weights;

	vec2 dx = vec2(1.0, 0.0);
	vec2 dy = vec2(0.0, 1.0);

	vec2 pc = texCoord*texture_size;

	vec2 tc = (floor(pc-vec2(0.5,0.5))+vec2(0.5,0.5));
     
	weights[0] = vec4(resampler(pc, tc    -dx    -dy), resampler(pc, tc           -dy), resampler(pc, tc    +dx    -dy), resampler(pc, tc+2.0*dx    -dy));
	weights[1] = vec4(resampler(pc, tc    -dx       ), resampler(pc, tc              ), resampler(pc, tc    +dx       ), resampler(pc, tc+2.0*dx       ));
	weights[2] = vec4(resampler(pc, tc    -dx    +dy), resampler(pc, tc           +dy), resampler(pc, tc    +dx    +dy), resampler(pc, tc+2.0*dx    +dy));
	weights[3] = vec4(resampler(pc, tc    -dx+2.0*dy), resampler(pc, tc       +2.0*dy), resampler(pc, tc    +dx+2.0*dy), resampler(pc, tc+2.0*dx+2.0*dy));

	dx = dx/texture_size;
	dy = dy/texture_size;
	tc = tc/texture_size;

	// reading the texels
	vec3 c00 = texture(textureSrc, tc    -dx    -dy).xyz;
	vec3 c10 = texture(textureSrc, tc           -dy).xyz;
	vec3 c20 = texture(textureSrc, tc    +dx    -dy).xyz;
	vec3 c30 = texture(textureSrc, tc+2.0*dx    -dy).xyz;
	vec3 c01 = texture(textureSrc, tc    -dx       ).xyz;
	vec3 c11 = texture(textureSrc, tc              ).xyz;
	vec3 c21 = texture(textureSrc, tc    +dx       ).xyz;
	vec3 c31 = texture(textureSrc, tc+2.0*dx       ).xyz;
	vec3 c02 = texture(textureSrc, tc    -dx    +dy).xyz;
	vec3 c12 = texture(textureSrc, tc           +dy).xyz;
	vec3 c22 = texture(textureSrc, tc    +dx    +dy).xyz;
	vec3 c32 = texture(textureSrc, tc+2.0*dx    +dy).xyz;
	vec3 c03 = texture(textureSrc, tc    -dx+2.0*dy).xyz;
	vec3 c13 = texture(textureSrc, tc       +2.0*dy).xyz;
	vec3 c23 = texture(textureSrc, tc    +dx+2.0*dy).xyz;
	vec3 c33 = texture(textureSrc, tc+2.0*dx+2.0*dy).xyz;

	//  Get min/max samples
	vec3 min_sample = min4(c11, c21, c12, c22);
	vec3 max_sample = max4(c11, c21, c12, c22);

	color = mat4x3(c00, c10, c20, c30) * weights[0];
	color+= mat4x3(c01, c11, c21, c31) * weights[1];
	color+= mat4x3(c02, c12, c22, c32) * weights[2];
	color+= mat4x3(c03, c13, c23, c33) * weights[3];
	color = color / dot(weights * vec4(1.0), vec4(1.0));

	// Anti-ringing
	vec3 aux = color;
	color = clamp(color, min_sample, max_sample);

	color = mix(aux, color, $Anti_Ringing);
 
	// final sum and weight normalization
	return vec4(color, 1.0);
}

void main()
{
	colorOut0 = JINC2_sharp(textureSrcResolution, passUV);
}
