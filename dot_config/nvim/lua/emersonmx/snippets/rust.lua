---@diagnostic disable: undefined-global

return {
    s("option", fmt("Option<{}>", i(1))),
    s("some", fmt("Some({})", i(1))),
    s("none", t("None")),
    s("result", fmt("Result<{}, {}>", { i(1, "T"), i(2, "E") })),
    s("ok", fmt("Ok({})", i(1))),
    s("err", fmt("Err({})", i(1))),
}
