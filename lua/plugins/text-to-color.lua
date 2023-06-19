return {
  'svermeulen/text-to-colorscheme',
	dependencies = { 'tsuyoshicho/vim-pass' },
  config = function ()
    require('text-to-colorscheme').setup {
      ai = {
        gpt_model = "gpt-3.5-turbo",
        openai_api_key = vim.fn['pass#get']('apikeys/openai_vim'),
      },
    }
  end
}
