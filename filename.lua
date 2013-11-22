function url_decode(str)
  str = string.gsub (str, "+", " ")
  str = string.gsub (str, "%%(%x%x)",
      function(h) return string.char(tonumber(h,16)) end)
  str = string.gsub (str, "\r\n", "\n")
  return str
end

function string:split(sep)
  local sep, fields = sep, {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

function read_meta()
  local metas = vlc.item:metas()
  local filename = metas.filename
  local name = vlc.item:uri()
  if not name then
    vlc.item:set_meta("title", filename)
    return
  end
  name = url_decode(name)
  local path_segments = string.split(name, "/")
  name = path_segments[#path_segments]
  local showName, seasonNumber, episodeNumber, title = string.match(name, "([^%-%d]+)%s*%-?%s*[%[Ss]?(%d?%d)[xEe](%d%d)%]?%s*%-?%s*(.*)")
  if not showName then
    vlc.item:set_meta("title", filename)
    return
  end
  showName = string.gsub(showName, "%.", " ")
  vlc.item:set_meta("title", showName .. " S" .. seasonNumber .. "E" .. episodeNumber .. " - " .. title)
  vlc.item:set_meta("showName", showName)
  vlc.item:set_meta("episodeNumber", episodeNumber)
  vlc.item:set_meta("seasonNumber", seasonNumber)
end
