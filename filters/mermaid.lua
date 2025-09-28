-- Filtro Pandoc Lua para converter blocos mermaid em imagens SVG
-- Salva os SVGs em assets/mermaid e inclui no documento

local pandoc = require 'pandoc'
local system = require 'pandoc.system'
local path = require 'pandoc.path'

local assets_dir = 'assets/mermaid'

-- Garante que o diretório existe
os.execute('mkdir -p ' .. assets_dir)

function CodeBlock(block)
  if block.classes[1] == 'mermaid' then
    -- Gera nome único para o arquivo SVG
    local diagram_hash = pandoc.sha1(block.text)
    local svg_filename = assets_dir .. '/mermaid-' .. diagram_hash .. '.svg'
    local mmd_filename = assets_dir .. '/mermaid-' .. diagram_hash .. '.mmd'

    -- Salva o código mermaid em arquivo .mmd
    local mmd_file = io.open(mmd_filename, 'w')
    mmd_file:write(block.text)
    mmd_file:close()

    -- Gera SVG usando Mermaid CLI
    local cmd = 'mmdc -i ' .. mmd_filename .. ' -o ' .. svg_filename
    local result = os.execute(cmd)
    if result ~= 0 then
      io.stderr:write('Erro ao gerar SVG com Mermaid CLI: ' .. cmd .. '\n')
    end

    -- Retorna bloco de inclusão da imagem
    if FORMAT:match('latex') then
      return pandoc.RawBlock('latex', '\\begin{center}\\includegraphics[width=0.9\\linewidth]{' .. svg_filename .. '}\\end{center}')
    else
      return pandoc.Para({pandoc.Image({'Diagrama Mermaid'}, svg_filename)})
    end
  end
end

return {
  {CodeBlock = CodeBlock}
}
