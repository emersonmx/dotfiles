-- Composables are PascalCase by convention; Android Studio suppresses the
-- FunctionName inspection for them, kotlin-lsp does not.
local function is_composable(bufnr, lnum)
    local first = math.max(lnum - 20, 0)
    local lines = vim.api.nvim_buf_get_lines(bufnr, first, lnum + 1, false)
    for i = #lines, 1, -1 do
        local l = lines[i]
        if l:find("@Composable", 1, true) then
            return true
        end
        if
            i < #lines
            and (l:match("^%s*$") or l:match("[{}]%s*$") or l:match("%*/%s*$"))
        then
            return false
        end
    end
    return false
end

local function filter(diagnostics, uri)
    local bufnr = vim.uri_to_bufnr(uri)
    if not vim.api.nvim_buf_is_loaded(bufnr) then
        return diagnostics
    end
    return vim.tbl_filter(function(d)
        local msg = d.message or ""
        return not (
            msg:match("^Function name .* should start with a lowercase letter")
            and is_composable(bufnr, d.range.start.line)
        )
    end, diagnostics)
end

return {
    handlers = {
        ["textDocument/publishDiagnostics"] = function(err, result, ctx)
            if result and result.diagnostics then
                result.diagnostics = filter(result.diagnostics, result.uri)
            end
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
        end,
        ["textDocument/diagnostic"] = function(err, result, ctx)
            if result and result.items then
                result.items = filter(result.items, ctx.params.textDocument.uri)
            end
            vim.lsp.diagnostic.on_diagnostic(err, result, ctx)
        end,
    },
}
