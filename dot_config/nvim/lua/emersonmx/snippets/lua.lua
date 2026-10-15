---@diagnostic disable: undefined-global

return {
    s("re", t("return ")),

    s(
        "if",
        fmt(
            [[
            if {} then:
                {}
            end
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "for",
        fmt(
            [[
            for {} do
                {}
            end
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "wh",
        fmt(
            [[
            while {} do
                {}
            end
            ]],
            { i(1), i(0) }
        )
    ),
    s("bk", t("break")),
    s("af", fmt("function({}) {} end", { i(1), i(0) })),
    s(
        "fn",
        fmt(
            [[
            function {}({})
                {}
            end
            ]],
            { i(1, "function_name"), i(2), i(3, "...") }
        )
    ),
    s(
        "cls",
        fmt(
            [[
            class {}:
                {}
            ]],
            { i(1, "ClassName"), i(2, "...") }
        )
    ),
    s(
        "ctor",
        fmt(
            [[
            local {} = {{}}

            function {}:new(obj)
                obj = obj or {{}}
                self.__index = self
                setmetatable(obj, self)
                return obj
            end
            ]],
            { i(1, "ClassName"), rep(1) }
        )
    ),
    s(
        "m",
        fmt(
            [[
            function {}:{}({})
                {}
            end
            ]],
            { i(1, "ClassName"), i(2, "method_name"), i(3), i(0) }
        )
    ),

    s("#!", t("#!/usr/bin/env lua")),
    s("o", fmt("local {} = {}", { i(1), i(0) })),
    s("pr", fmt("print({})", i(0))),
    s(
        "fs",
        fmt(
            [[
            string.format("{}", {})
            ]],
            { i(1), i(2) }
        )
    ),
}
