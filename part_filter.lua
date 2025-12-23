-- Lua filter to convert part headers to \part{} commands
function Header(el)
  -- Check if this is a part file by looking at the source file
  -- For now, we'll check if the header text matches part titles
  local part_titles = {
    "Rethinking What Reality Is Made Of",
    "Interfaces in the Physical World", 
    "Life, Mind, and Intelligence",
    "Meaning, Knowledge, and Ontology",
    "Artificial Intelligence and Discovery",
    "Design, Ethics, and the Human Future"
  }
  
  if el.level == 1 then
    for _, title in ipairs(part_titles) do
      if el.content[1] and el.content[1].text == title then
        -- Convert to part
        return pandoc.RawBlock('latex', '\\part{' .. pandoc.utils.stringify(el.content) .. '}')
      end
    end
  end
  return el
end

