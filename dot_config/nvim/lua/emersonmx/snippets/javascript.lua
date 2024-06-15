---@diagnostic disable: undefined-global

return {
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
            constructor({}) {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s("af", fmt("({}) => {}", { i(1), i(0) })),
    s(
        "fn",
        fmt(
            [[
            function {}({}) {{
                {}
            }}
            ]],
            { i(1, "functionName"), i(2), i(0) }
        )
    ),
    s(
        "m",
        fmt(
            [[
            {}({}) {{
                {}
            }}
            ]],
            { i(1, "methodName"), i(2), i(0) }
        )
    ),

    s("re", t("return")),
    s(
        "cb",
        fmt(
            [[
            {{
                {}
            }}
            ]],
            i(0)
        )
    ),
    s(
        "if",
        fmt(
            [[
            if ({}) {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),

    s("pr", fmt("console.log({})", i(0))),
}
