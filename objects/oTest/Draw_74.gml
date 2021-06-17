if (!keyboard_check(vk_space))
{
    var _texture = surface_get_texture(application_surface);
    var _texel_w = texture_get_texel_width( _texture);
    var _texel_h = texture_get_texel_height(_texture);
    
    shader_set(shdContrastChecker);
    shader_set_uniform_f(shader_get_uniform(shdContrastChecker, "u_vTexel"), _texel_w, _texel_h);
    shader_set_uniform_f(shader_get_uniform(shdContrastChecker, "u_fContrastTarget"), 4.5);
    draw_surface(application_surface, 0, 0);
    shader_reset();
}

if (keyboard_check(ord("C")))
{
    var _texture = surface_get_texture(application_surface);
    var _texel_w = texture_get_texel_width( _texture);
    var _texel_h = texture_get_texel_height(_texture);
    
    shader_set(shdContrast);
    shader_set_uniform_f(shader_get_uniform(shdContrast, "u_vTexel"), _texel_w, _texel_h);
    draw_surface(application_surface, 0, 0);
    shader_reset();
}

if (keyboard_check(ord("L")))
{
    var _texture = surface_get_texture(application_surface);
    var _texel_w = texture_get_texel_width( _texture);
    var _texel_h = texture_get_texel_height(_texture);
    
    shader_set(shdLuminence);
    draw_surface(application_surface, 0, 0);
    shader_reset();
}