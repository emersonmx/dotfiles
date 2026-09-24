---@diagnostic disable: undefined-global

return {
    s("re", t("return ")),

    s("pu", t("public ")),
    s("po", t("protected ")),
    s("pi", t("private ")),

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
