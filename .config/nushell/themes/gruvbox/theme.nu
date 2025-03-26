use ./colors.nu

export const dark = {
    separator: $colors.gruvbox_fg
    leading_trailing_space_bg: { attr: n }
    header: $colors.gruvbox_gray_bold
    empty: $colors.gruvbox_blue
    bool: $colors.gruvbox_fg
    int: $colors.gruvbox_fg
    filesize: $colors.gruvbox_fg
    duration: $colors.gruvbox_fg
    date: $colors.gruvbox_fg
    range: $colors.gruvbox_fg
    float: $colors.gruvbox_fg
    string: $colors.gruvbox_fg
    nothing: $colors.gruvbox_fg
    binary: $colors.gruvbox_fg
    cellpath: $colors.gruvbox_fg
    row_index: $colors.gruvbox_gray
    record: $colors.gruvbox_fg
    list: $colors.gruvbox_fg
    block: $colors.gruvbox_fg
    hints: $colors.gruvbox_gray

    shape_garbage: $colors.gruvbox_red_bold
    shape_binary: $colors.gruvbox_purple_bold
    shape_bool: $colors.gruvbox_aqua
    shape_int: $colors.gruvbox_purple_bold
    shape_float: $colors.gruvbox_purple_bold
    shape_range: $colors.gruvbox_yellow_bold
    shape_internalcall: $colors.gruvbox_aqua_bold
    shape_external: $colors.gruvbox_aqua
    shape_externalarg: $colors.gruvbox_green_bold
    shape_literal: $colors.gruvbox_aqua
    shape_operator: $colors.gruvbox_yellow
    shape_signature: $colors.gruvbox_green_bold
    shape_string: $colors.gruvbox_green
    shape_string_interpolation: $colors.gruvbox_aqua_bold
    shape_datetime: $colors.gruvbox_aqua_bold
    shape_list: $colors.gruvbox_aqua_bold
    shape_table: $colors.gruvbox_blue_bold
    shape_record: $colors.gruvbox_aqua_bold
    shape_block: $colors.gruvbox_blue_bold
    shape_filepath: $colors.gruvbox_blue
    shape_globpattern: $colors.gruvbox_aqua_bold
    shape_variable: $colors.gruvbox_purple
    shape_flag: $colors.gruvbox_blue_bold
    shape_custom: $colors.gruvbox_green
    shape_nothing: $colors.gruvbox_aqua
}
