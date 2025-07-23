local easycomplete = require("easycomplete")
local util = require("easycomplete.util")
local console = util.console
local this = {}

function this.setup()
  easycomplete.register_source({
      name           = "docker",
      whitelist      = {"docker", "dockerfile"},
      completor      = require('easycomplete_docker').completor,
      constructor    = require('easycomplete_docker').constructor,
      gotodefinition = require('easycomplete_docker').goto_definition,
      filter         = require('easycomplete_docker').filter,
      command        = "docker-langserver"
    })
end

function this.constructor(opt, ctx)
  easycomplete.register_lsp_server(opt, {
      name = "docker-langserver",
      cmd = {easycomplete.get_command(opt["name"]), "--stdio"},
      root_uri = easycomplete.get_default_root_uri(),
      allowlist = opt["whitelist"],
    })
end

function this.completor(...)
  return easycomplete.do_lsp_complete(unpack({...}))
end

function this.filter(matches, ctx)
  return matches
end

function this.goto_definition(...)
  return easycomplete.do_lsp_defination()
end

return this

