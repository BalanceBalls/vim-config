local setup, ollama = pcall(require, "ollama")
if not setup then
  return
end

ollama.setup{
  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  -- Sample keybind for prompting. Note that the <c-u> is important for selections to work properly.
  keys = {
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },
  },
	prompts = {
    ReviewCode = {
      prompt = "Review the following code and make concise suggestions:\n```$ftype\n$sel\n```",
      input_label = "> ",
      action = "display",
    },
		RubberDuck = {
      prompt = "Be my rubber duck. I will share my thoughts with you and you can help me brainstorm ideas by briefly providing relevant ideas and asking suggestive questions. Here is what I think: $input",
      input_label = "> ",
      action = "display",
    }
  }
}
