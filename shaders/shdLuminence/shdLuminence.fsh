varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float luminence(vec3 colour)
{
    float red   = (colour.r < 0.03928)? colour.r / 12.92 : pow((colour.r + 0.055) / 1.055, 2.4);
    float green = (colour.g < 0.03928)? colour.g / 12.92 : pow((colour.g + 0.055) / 1.055, 2.4);
    float blue  = (colour.b < 0.03928)? colour.b / 12.92 : pow((colour.b + 0.055) / 1.055, 2.4);
    
    return 0.2126*red + 0.7152*green + 0.0722*blue;
}

void main()
{
    vec4 sampleC = texture2D(gm_BaseTexture, v_vTexcoord);
    float lumC = luminence(sampleC.rgb);
    gl_FragColor = vec4(vec3(lumC), 1.0);
}
