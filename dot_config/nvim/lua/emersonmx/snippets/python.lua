---@diagnostic disable: undefined-global

return {
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
        "dtcls",
        fmt(
            [[
            @dataclass{}
            class {}:
                {}
            ]],
            { i(1), i(2, "DataClassName"), i(3, "...") }
        )
    ),
    s(
        "pcls",
        fmt(
            [[
            class {}(Protocol):
                {}
            ]],
            { i(1, "DataClassName"), i(2, "...") }
        )
    ),
    s(
        "ctor",
        fmt(
            [[
            def __init__(self) -> None:
                {}
            ]],
            i(1, "...")
        )
    ),
    s(
        "def",
        fmt(
            [[
            def {}({}) -> {}:
                {}
            ]],
            { i(1, "function_name"), i(2), i(3, "None"), i(4, "...") }
        )
    ),

    s("true", t("True")),
    s("false", t("False")),
    s("re", t("return")),

    s("pr", fmt("print({})", i(0))),
    s("fs", fmt("f'{}'", i(0))),

    s("#!", fmt("#!/usr/bin/env {}", i(0, "python"))),
    s(
        "ifmain",
        fmt(
            [[
            def {}() -> int:
                {}
                return 0


            if __name__ == '__main__':
                raise SystemExit({}())
            ]],
            { i(1, "main"), i(0), rep(1) }
        )
    ),
    s(
        "aifmain",
        fmt(
            [[
            import asyncio


            async def {}() -> int:
                {}
                return 0


            if __name__ == '__main__':
                raise SystemExit(asyncio.run({}()))
            ]],
            { i(1, "main"), i(0), rep(1) }
        )
    ),

    s("#ti", t("# type: ignore")),
    s("#nq", t("# noqa")),
    s("#nc", t("# pragma: no cover")),
}
