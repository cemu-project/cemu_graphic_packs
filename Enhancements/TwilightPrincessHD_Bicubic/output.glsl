// https://github.com/obsproject/obs-studio/blob/master/libobs/data/bicubic_scale.effect // added customizable polynomials back

#version 420

in vec2 passUV;
layout(binding=0) uniform sampler2D textureSrc;
// uniform vec2 textureSrcResolution;
layout(location = 0) out vec4 colorOut0;

float weight(float x)
{
	float ax = abs(x);

	const float B = $b;
	const float C = $c;

	if (ax < 2.0) {
		float x_squared = x * x;
		if (ax < 1.0) {
			return (x_squared *
			((12.0 - 9.0 * B - 6.0 * C) * ax +
				(-18.0 + 12.0 * B + 6.0 * C)) +
				(6.0 - 2.0 * B))
			/ 6.0;
		}

		return (x_squared *
			((-B - 6.0 * C) * ax + (6.0 * B + 30.0 * C)) +
				(-12.0 * B - 48.0 * C) * ax +
				(8.0 * B + 24.0 * C))
			/ 6.0;
	}

	return 0.0;
}

vec4 weight4(float x)
{
	return vec4(
		weight(x - 2.0),
		weight(x - 1.0),
		weight(x),
		weight(x + 1.0));
}

vec4 DrawBicubic(vec2 f_in)
{
	vec2 textureSrcResolution = vec2( textureSize(textureSrc,0) );
	vec2 stepxy = 1.0/textureSrcResolution;
	vec2 pos = f_in.st + stepxy * 0.5;
	vec2 f = fract(pos * textureSrcResolution);

	vec4 rowtaps = weight4(1.0 - f.x);
	vec4 coltaps = weight4(1.0 - f.y);

	vec2 uv0 = (-1.5 - f) * stepxy + pos;
	vec2 uv1 = uv0 + stepxy;
	vec2 uv2 = uv1 + stepxy;
	vec2 uv3 = uv2 + stepxy;

	float u_weight_sum = rowtaps.y + rowtaps.z;
	float u_middle_offset = rowtaps.z * stepxy.x / u_weight_sum;
	float u_middle = uv1.x + u_middle_offset;

	float v_weight_sum = coltaps.y + coltaps.z;
	float v_middle_offset = coltaps.z * stepxy.y / v_weight_sum;
	float v_middle = uv1.y + v_middle_offset;

	// wrap doesn't apply to texelFetch
	// clamp
//	ivec2 coord_top_left = ivec2(max(uv0 * textureSrcResolution, 0.5));
//	ivec2 coord_bottom_right = ivec2(min(uv3 * textureSrcResolution, textureSrcResolution - 0.5));
	// mirror
	ivec2 coord_top_left = ivec2(abs(uv0 * textureSrcResolution));
	ivec2 coord_bottom_right = ivec2(textureSrcResolution - abs(uv3 * textureSrcResolution - textureSrcResolution));

	vec4 top = texelFetch(textureSrc, ivec2(coord_top_left), 0) * rowtaps.x;
	top += texture(textureSrc, vec2(u_middle, uv0.y)) * u_weight_sum;
	top += texelFetch(textureSrc, ivec2(coord_bottom_right.x, coord_top_left.y), 0) * rowtaps.w;
	vec4 total = top * coltaps.x;

	vec4 middle = texture(textureSrc, vec2(uv0.x, v_middle)) * rowtaps.x;
	middle += texture(textureSrc, vec2(u_middle, v_middle)) * u_weight_sum;
	middle += texture(textureSrc, vec2(uv3.x, v_middle)) * rowtaps.w;
	total += middle * v_weight_sum;

	vec4 bottom = texelFetch(textureSrc, ivec2(coord_top_left.x, coord_bottom_right.y), 0) * rowtaps.x;
	bottom += texture(textureSrc, vec2(u_middle, uv3.y)) * u_weight_sum;
	bottom += texelFetch(textureSrc, ivec2(coord_bottom_right), 0) * rowtaps.w;
	total += bottom * coltaps.w;

	return total;
}

void main()
{
	colorOut0 = vec4(DrawBicubic(passUV).rgb,1.0);
}
