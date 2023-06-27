return {
  {'stevearc/dressing.nvim',
    dependencies = {
      'nvim-telescope/telescope-ui-select.nvim',
    },
    opts = {
      select = {
        backend = {'telescope'}
      }
    }
  }
}
