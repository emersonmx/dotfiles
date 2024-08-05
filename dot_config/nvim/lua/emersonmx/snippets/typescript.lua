---@diagnostic disable: undefined-global

return {
    s("pu", t("public ")),
    s("po", t("protected ")),
    s("pi", t("private ")),
    s("ro", t("readonly ")),

    s(
        "st",
        fmt(
            [[
            type {} = {{
                {}
            }};
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "in",
        fmt(
            [[
            interface {} {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
}
