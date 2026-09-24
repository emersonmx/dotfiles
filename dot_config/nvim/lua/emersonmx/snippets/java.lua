---@diagnostic disable: undefined-global

return {
    s("re", t("return ")),

    s("pu", t("public ")),
    s("po", t("protected ")),
    s("pi", t("private ")),

    s(
        "cls",
        fmt(
            [[
            class {} {{
                {}
            }}
            ]],
            { i(1, "ClassName"), i(0) }
        )
    ),
    s(
        "ctor",
        fmt(
            [[
            {}({}) {{
                {}
            }}
            ]],
            { i(1, "ClassName"), i(2), i(0) }
        )
    ),

    s(
        "pr",
        fmt(
            [[
            System.out.println("{}")
            ]],
            { i(1) }
        )
    ),
}
