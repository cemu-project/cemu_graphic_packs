#version 420

#ifdef VULKAN
layout(location = 0) in vec2 passUV;
layout(binding = 0) uniform sampler2D textureSrc;
layout(location = 0) out vec4 colorOut0;
#else
in vec2 passUV;
layout(binding=0) uniform sampler2D textureSrc;
layout(location = 0) out vec4 colorOut0;
#endif

ivec2 resolution = textureSize(textureSrc,0); // Retrieve Texture Dimensions
precision highp float;
vec2 RcpFrame = vec2(1.0 / float(resolution.x), 1.0 / float(resolution.y));

/* 
https://github.com/haasn/gentoo-conf/blob/xor/home/nand/.mpv/shaders/LICENSE
 
Copyright (c) 2015 Niklas Haas

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
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/* 
Ordered dithering reshade
https://github.com/crosire/reshade/blob/master/LICENSE.md

Copyright 2014 Patrick Mours. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/


#define THRESHOLD $Threshold //32

// The range (in source pixels) at which to sample for neighbours. Higher values
// will find more gradients, but lower values will deband more aggressively.
#define RANGE $Range //16

// The number of debanding iterations to perform. Each iteration samples from
// random positions, so increasing the number of iterations is likely to
// increase the debanding quality. Conversely, it slows the shader down.
// (Each iteration will use a multiple of the configured RANGE, and a
// successively lower THRESHOLD - so setting it much higher has little effect)
#define ITERATIONS $Iterations //4

// (Optional) Add some extra noise to the image. This significantly helps cover
// up remaining banding and blocking artifacts, at comparatively little visual
// quality. Higher = more grain. Setting it to 0 disables the effect.
#define GRAIN $Grain //10

// Note: If performance is too slow, try eg. RANGE=16 ITERATIONS=2. In general,
// an increase in the number of ITERATIONS should roughly correspond to a
// decrease in RANGE and perhaps an increase in THRESHOLD.
//------------ End of configuration ------------
// Wide usage friendly PRNG, shamelessly stolen from a GLSL tricks forum post
float mod289(float x)  { return x - floor(x / 289.0) * 289.0; }
float permute(float x) { return mod289((34.0*x + 1.0) * x); }
float rand(float x)    { return fract(x / 41.0); }

// Helper: Calculate a stochastic approximation of the avg color around a pixel
vec4 average(sampler2D tex, vec2 pos, float range, inout float h)
{
    // Compute a random rangle and distance
    float dist = rand(h) * range;     h = permute(h);
    float dir  = rand(h) * 6.2831853; h = permute(h);

    vec2 pt = dist / resolution;
    vec2 o = vec2(cos(dir), sin(dir));

    // Sample at quarter-turn intervals around the source pixel
    vec4 ref[4];
    ref[0] = texture(tex, pos + pt * vec2( o.x,  o.y));
    ref[1] = texture(tex, pos + pt * vec2(-o.y,  o.x));
    ref[2] = texture(tex, pos + pt * vec2(-o.x, -o.y));
    ref[3] = texture(tex, pos + pt * vec2( o.y, -o.x));

    // Return the (normalized) average
    return (ref[0] + ref[1] + ref[2] + ref[3])/4.0;
}

vec4 getreader(sampler2D tex, vec2 pos, vec2 tex_size)
{
    float h;
    // Initialize the PRNG by hashing the position + a random uniform
    vec3 m = vec3(pos, gl_FragCoord.xy*passUV) + vec3(1.0);
    h = permute(permute(permute(m.x)+m.y)+m.z);

    // Sample the source pixel
    vec4 col = texture(tex, pos);

    for (int i = 1; i <= ITERATIONS; i++) {
        // Use the average instead if the difference is below the threshold
        vec4 avg = average(tex, pos, i*RANGE, h);
        vec4 diff = abs(col - avg);
        col = mix(avg, col, greaterThan(diff, vec4(THRESHOLD/(i*16384.0))));
    }

	// Ordered dithering of output
	const float dither_bit = 8.0; //WiiU backbuffer RGBA_8, if used in shader, check if depth is RBG_16_A2 
	
	float grid_position = fract(dot(passUV, (resolution * vec2(1.0 / 16.0, 10.0 / 36.0)) + 0.25));
	float dither_shift = 0.25 * (1.0 / (pow(2, dither_bit) - 1.0));
	vec3 dither_shift_RGB = vec3(dither_shift, -dither_shift, dither_shift); //Shift the individual colors, subpixel dithering
	dither_shift_RGB = mix(2.0 * dither_shift_RGB, -2.0 * dither_shift_RGB, grid_position); //shift acording to grid position.
	col.rgb += (GRAIN/255.0) * dither_shift_RGB;
    return col;
}

void main()
{
colorOut0 = vec4(getreader(textureSrc, passUV, resolution).rgb,1.0);
}
