
#version 420

in vec2 passUV;
layout(binding=0) uniform sampler2D textureSrc;
uniform vec2 textureSrcResolution;
layout(location = 0) out vec4 colorOut0;

vec4 cubic(float x)
{
	float x2 = x * x;
	float x3 = x2 * x;
	vec4 w;
	w.x = -x3 + 3 * x2 - 3 * x + 1;
	w.y = 3 * x3 - 6 * x2 + 4;
	w.z = -3 * x3 + 3 * x2 + 3 * x + 1;
	w.w = x3;
	return w / 6.0;
}

vec4 bcFilter(vec2 texcoord, vec2 texscale)
{
	float fx = fract(texcoord.x);
	float fy = fract(texcoord.y);
	texcoord.x -= fx;
	texcoord.y -= fy;

	vec4 xcubic = cubic(fx);
	vec4 ycubic = cubic(fy);

	vec4 c = vec4(texcoord.x - 0.5, texcoord.x + 1.5, texcoord.y - 0.5, texcoord.y + 1.5);
	vec4 s = vec4(xcubic.x + xcubic.y, xcubic.z + xcubic.w, ycubic.x + ycubic.y, ycubic.z + ycubic.w);
	vec4 offset = c + vec4(xcubic.y, xcubic.w, ycubic.y, ycubic.w) / s;

	vec4 sample0 = texture(textureSrc, vec2(offset.x, offset.z) * texscale);
	vec4 sample1 = texture(textureSrc, vec2(offset.y, offset.z) * texscale);
	vec4 sample2 = texture(textureSrc, vec2(offset.x, offset.w) * texscale);
	vec4 sample3 = texture(textureSrc, vec2(offset.y, offset.w) * texscale);

	float sx = s.x / (s.x + s.y);
	float sy = s.z / (s.z + s.w);

	return mix(
		mix(sample3, sample2, sx),
		mix(sample1, sample0, sx), sy);
}

void main(){
	colorOut0 = vec4(bcFilter(passUV*textureSrcResolution, vec2(1.0,1.0)/textureSrcResolution).rgb,1.0);
}
