local function map(array, func)
  local new_array = {}
  for i, v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end

local function print_client(c)
  return {
    name = c.name or "",
    class = c.class or "",
    instance = c.instance or "",
    role = c.role or "",
    floating = c.floating or false,
    minimized = c.minimized or false,
    maximized = c.maximized or false,
    hidden = c.hidden or false,
  }
end

local function print_clients(clients)
  return map(clients, print_client)
end

return require("gears.debug").dump_return(print_clients(client.get()))
