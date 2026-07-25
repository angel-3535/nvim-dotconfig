return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      strict = true,
      override_by_filename = {
        [".config"] = { icon = "", color = "#6d8086", name = "Config" },
        [".github"] = { icon = "", color = "#ffffff", name = "Github" },
        [".vscode"] = { icon = "", color = "#007acc", name = "Vscode" },
        ["app"] = { icon = "󰵆", color = "#42a5f5", name = "App" },
        ["assets"] = { icon = "󰉏", color = "#ffb74d", name = "Assets" },
        ["components"] = { icon = "󰅴", color = "#4dd0e1", name = "Components" },
        ["config"] = { icon = "", color = "#6d8086", name = "Config" },
        ["dist"] = { icon = "󰏗", color = "#ffb74d", name = "Dist" },
        ["docs"] = { icon = "󱂷", color = "#42a5f5", name = "Docs" },
        ["images"] = { icon = "󰉏", color = "#ba68c8", name = "Images" },
        ["lib"] = { icon = "󰲂", color = "#ffd54f", name = "Lib" },
        ["node_modules"] = { icon = "", color = "#8bc34a", name = "NodeModules" },
        ["public"] = { icon = "󰉌", color = "#ffb74d", name = "Public" },
        ["scripts"] = { icon = "󱁽", color = "#81c784", name = "Scripts" },
        ["src"] = { icon = "󰴉", color = "#ba68c8", name = "Src" },
        ["test"] = { icon = "󱞊", color = "#4db6ac", name = "Test" },
        ["tests"] = { icon = "󱞊", color = "#4db6ac", name = "Tests" },
        ["utils"] = { icon = "󰒓", color = "#90a4ae", name = "Utils" },
      },
    })
  end,
}
