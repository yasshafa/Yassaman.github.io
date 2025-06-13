
local appendixcount = 0
local app = {}
local kAriaExpanded = "aria-expanded"
local refhyperlinks = true
-- Word for appendix
local appendixword = "Appendix"

getappendixword = function(meta)
  if meta.language and meta.language["crossref-apx-prefix"] then
    appendixword = pandoc.utils.stringify(meta.language["crossref-apx-prefix"])
  end
end

local function cite_appendix(ct)

  
  local floatreftext
    
    --Is the citation a reference to a section?
  if #ct.citations == 1 and (string.find(ct.citations[1].id, "^sec%-") or string.find(ct.citations[1].id, "^apx%-")) and app[ct.citations[1].id] then 
    
    
    
    -- Text for section reference
      if appendixcount == 1 then
        floatreftext = pandoc.Inlines({pandoc.Str(appendixword)})
        else
          floatreftext = pandoc.Inlines({pandoc.Str(appendixword), pandoc.Str('\u{a0}'), pandoc.Str(app[ct.citations[1].id])})
      end
      
      
      
      if floatreftext == nil then
        quarto.log.warning("Cannot find @" .. ct.citations[1].id)
        return floatreftext
      end
      if refhyperlinks then
        -- create link
        local reflink = pandoc.Link(floatreftext, "#" .. ct.citations[1].id)
        reflink.classes = {"quarto-xref"}
        reflink.attributes[kAriaExpanded] = "false"
        return reflink
      else
        return floatreftext
      end
      

  end
  
  



end

local function getappendix(h) 
  if h.attr.attributes.appendixtitle then
    app[h.identifier] = h.attr.attributes.appendixtitle
    appendixcount = appendixcount + 1
  end
  
end


return {
  {Meta = getappendixword},
   {Header = getappendix},
  { Cite = cite_appendix }
  }