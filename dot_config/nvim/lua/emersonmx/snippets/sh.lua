---@diagnostic disable: undefined-global

return {
    s("#!", t("#!/bin/bash")),
    s("safe", t("set -euo pipefail")),
}
