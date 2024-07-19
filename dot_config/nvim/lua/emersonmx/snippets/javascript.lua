---@diagnostic disable: undefined-global

return {
    s("re", t("return")),

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
    s(
        "for",
        fmt(
            [[
            for ({}) {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "while",
        fmt(
            [[
            while ({}) {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
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
    s("af", fmt("({}) => {}", { i(1), i(0) })),
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
    s("req", fmt("const {{ {} }} = require({});", { i(2), i(1) })),
    s("pr", fmt("console.log({})", i(0))),
}
