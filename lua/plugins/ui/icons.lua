local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.set_icon {
    dg = {icon = "", color = "#61afef", name = "dg"},
    txt = {icon = "", color = "#6d8086", name = "txt"}
}
