lua << EOF
package.loaded['lunarline'] = nil
package.loaded['lunarline.components.active_clients'] = nil
package.loaded['lunarline.components.cursor_position'] = nil
package.loaded['lunarline.components.diagnostics'] = nil
package.loaded['lunarline.components.filename'] = nil
package.loaded['lunarline.components.git_branch'] = nil
package.loaded['lunarline.components.line_col'] = nil
package.loaded['lunarline.components.mode'] = nil
package.loaded['lunarline.highlights.general'] = nil
package.loaded['lunarline.highlights.special'] = nil
package.loaded['lunarline.utils'] = nil
package.loaded['lunarline.utils.trunc_width'] = nil
EOF
