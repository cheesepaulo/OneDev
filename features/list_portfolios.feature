# language:pt

@list_portfolios
Funcionalidade: Listar Portfólios
  Portfólios do usuário são exibidos ao acessar a lista de portfólios

  Cenário de Fundo:
    Dado usuário está logado

  Cenário: Usuário logado e com portfólios cadastrados dever ver somente os seus portfolios
    E que existem 5 portfólios cadastrados de outros usuários
    E possui 5 portfólios cadastrados
    Quando acessa a lista de portfólios
    Então os 5 portfólios são listados


  Cenário: Usuário logado e sem portfólios cadastrados
    E que existem 5 portfólios cadastrados de outros usuários
    E possui 0 portfólios cadastrados
    Quando acessa a lista de portfólios
    Então os 0 portfólios são listados


  Cenário: Usuário não está logado
    E possui 5 portfólios cadastrados
    Quando faz o logout
    E acessa a lista de portfólios
    Então volta para a página de login
