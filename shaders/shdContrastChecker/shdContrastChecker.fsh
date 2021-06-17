varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexel;
uniform float u_fContrastTarget;

float luminence(vec3 colour)
{
    float red   = (colour.r < 0.03928)? colour.r / 12.92 : pow((colour.r + 0.055) / 1.055, 2.4);
    float green = (colour.g < 0.03928)? colour.g / 12.92 : pow((colour.g + 0.055) / 1.055, 2.4);
    float blue  = (colour.b < 0.03928)? colour.b / 12.92 : pow((colour.b + 0.055) / 1.055, 2.4);
    
    return 0.2126*red + 0.7152*green + 0.0722*blue;
}

float contrast(float lumA, float lumB)
{
    if (lumA >= lumB)
    {
        return (lumA + 0.05) / (lumB + 0.05);
    }
    else
    {
        return (lumB + 0.05) / (lumA + 0.05);
    }
}

void main()
{
    vec4 sampleU = texture2D(gm_BaseTexture, v_vTexcoord + vec2( u_vTexel.x,         0.0));
    vec4 sampleD = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-u_vTexel.x,         0.0));
    vec4 sampleL = texture2D(gm_BaseTexture, v_vTexcoord + vec2(        0.0,  u_vTexel.y));
    vec4 sampleR = texture2D(gm_BaseTexture, v_vTexcoord + vec2(        0.0, -u_vTexel.y));
    
    float lumU = luminence(sampleU.rgb);
    float lumD = luminence(sampleD.rgb);
    float lumL = luminence(sampleL.rgb);
    float lumR = luminence(sampleR.rgb);
    
    float contrastMax = max(contrast(lumL, lumR), contrast(lumU, lumD));
    
    if (contrastMax > u_fContrastTarget)
    {
        gl_FragColor = vec4(0.71, 0.98, 0.01, 1.0);
    }
    else
    {
        gl_FragColor = vec4(0.98, 0.28, 0.01, 1.0);
    }
}
