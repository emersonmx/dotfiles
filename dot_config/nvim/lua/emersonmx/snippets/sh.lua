---@diagnostic disable: undefined-global

return {
    s("#!", t("#!/usr/bin/env bash")),
    s("safe", t("set -euo pipefail")),
}
