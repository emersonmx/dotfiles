---@diagnostic disable: undefined-global

return {
    s("i8", t("int8_t ")),
    s("i16", t("int16_t ")),
    s("i32", t("int32_t ")),
    s("i64", t("int64_t ")),
    s("u8", t("uint8_t ")),
    s("u16", t("uint16_t ")),
    s("u32", t("uint32_t ")),
    s("u64", t("uint64_t ")),
    s("null", t("NULL")),
    s("re", t("return ")),

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
        "wh",
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
        "sw",
        fmt(
            [[
            switch ({}) {{
            {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s("cs", fmt("case {}:", i(1))),
    s("df", t("default:")),
    s("bk", t("break")),
    s(
        "fn",
        fmt(
            [[
            {} {}({})
            {{
                {}
            }}
            ]],
            { i(1, "void"), i(2, "func_name"), i(3), i(0) }
        )
    ),

    s(
        "once",
        fmt(
            [[
            #ifndef {}
            #define {}

            {}

            #endif // {}
            ]],
            { i(1, "MYHEADER_H"), rep(1), i(0), rep(1) }
        )
    ),
    s("inc", t("#include ")),
    s("def", t("#define ")),
    s("pr", fmt("printf({})", i(0))),
}
