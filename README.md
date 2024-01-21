# Jogo de Pedra, Papel e Tesoura

Este projeto Flutter/Dart implementa um simples Jogo de Pedra, Papel e Tesoura que segue os princípios do padrão BLoC (Business Logic Component) e da Arquitetura Limpa (Clean Architecture) para a organização do código e fluxo de dados.

## Estrutura do Projeto

O código é estruturado da seguinte forma:

- `controllers`: Contém os BLoCs que gerenciam o estado e a lógica do negócio do jogo.
- `domain`: Define as regras de negócio do jogo, contendo:
  - `constants`: Valores constantes utilizados no domínio.
  - `entities`: Modelos de dados.
  - `enums`: Enumerações para tipos de movimentos e regras.
  - `interfaces`: Contratos para implementação das regras do jogo.
- `mixins`: Funcionalidades compartilhadas que podem ser misturadas com outras classes.
- `rules`: Conjunto de classes que implementam as regras do jogo, incluindo padrões e variantes como "Big Bang Theory".
- `screens`: Telas da aplicação.
- `widgets`: Componentes da interface do usuário, como ícones para os movimentos.

## Instalação

Para rodar o projeto localmente, siga os passos abaixo:

1. Faça o clone do repositório.
2. No terminal, navegue até a pasta do projeto e execute `flutter pub get` para instalar as dependências.
3. Use `flutter run` para iniciar o aplicativo em um dispositivo conectado ou emulador.

## Versão

Flutter 3.16.0 ou superior

## Licença

Este projeto está sob a licença MIT. Para mais informações, consulte o arquivo `LICENSE`.
