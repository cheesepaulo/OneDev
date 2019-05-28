# Aula: Criando a lista de portfólios (portfólio)
  Passo 2 de Listando os portfólios
    - ajusta o snippet pra remover a primeira linha
      ```ruby
        class PortfoliosController < ApplicationController
          before_action :load_portfolios, only: :index

          def index
              authorize(Portfolio)
              @portfolios = policy_scope(Portfolio)
          end
        end
      ```

# Aula: Customizar as views do devise
  Ajustar o snippet da partial devise/registrations/_new.html.erb
    trocar ->   <%= devise_error_messages! %>
    por ->      <%= render partial: 'devise/shared/error_messages' %>

  **Está deprecated o método devise_error_messages**


# Aula: Criando um novo portfólio (portfólio)
   O texto de alguns passos esta bugando onde deveria ficar itálico/negrito ta saindo em texto puro
   Algo como crie a view _edit_.html.erb  
   **Acabei passando batido e criei como partial**
