-- filters/minted.lua
-- Pandoc Lua filter: converts fenced code blocks to minted environments.
-- Usage: pandoc --lua-filter=filters/minted.lua

local function escape(str)
  -- basic TeX escaping for backslashes and braces inside code
  str = str:gsub('\\', '\\textbackslash{}')
  str = str:gsub('{', '\\{')
  str = str:gsub('}', '\\}')
  return str
end

function CodeBlock(cb)
  -- Detect language from classes; default to 'text' if none
  local lang = 'text'
  if cb.classes and #cb.classes > 0 then
    lang = cb.classes[1]
  end

  -- Collect minted options from attributes or set defaults
  local opts = { 'fontsize=\\small', 'breaklines' }
  if cb.attributes and cb.attributes['linenos'] == 'true' then
    table.insert(opts, 'linenos')
  end
  if cb.attributes and cb.attributes['startinline'] == 'true' then
    table.insert(opts, 'startinline=true')
  end
  if cb.attributes and cb.attributes['frame'] then
    table.insert(opts, 'frame=' .. cb.attributes['frame'])
  end

  local options = table.concat(opts, ', ')

  -- Build LaTeX for minted environment
  local content = cb.text
  -- Don't escape content; minted expects raw code. Just wrap in environment.
  local minted = string.format("\\begin{minted}[%s]{%s}\n%s\n\\end{minted}", options, lang, content)

  return pandoc.RawBlock('latex', minted)
end
