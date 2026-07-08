return {
  -- navegação rápida entre controller <-> view <-> route
  { "jwalton512/vim-blade", ft = "blade" }, -- fallback de sintaxe se o treesitter blade falhar

  -- gera _ide_helper.php pra autocomplete de facades/models (rode :! composer require --dev barryvdh/laravel-ide-helper)
  -- e depois: php artisan ide-helper:generate / :models / :meta
}
