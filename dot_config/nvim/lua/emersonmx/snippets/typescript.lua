---@diagnostic disable: undefined-global

return {
    s("pu", t("public ")),
    s("po", t("protected ")),
    s("pi", t("private ")),
    s("ro", t("readonly ")),

    s("imp", fmt("import {{ {} }} from {};", { i(2), i(1) })),
}
