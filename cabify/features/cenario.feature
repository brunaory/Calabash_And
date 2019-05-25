
  #encoding: utf-8
  #language: pt

Funcionalidade: Solicitar corrida
  Como usuário do QAbify
  Quero ter o máximo de informações sobre a corrida
  Para fazer a melhor escolha

Cenário: Verificar a estimativa lite
  Dado que salvei o token após o login
  Quando selecionar as opções da minha corrida para o tipo lite
  Então quero ter uma estimativa do valor final

Cenário: Verificar a estimativa executive
  Dado que salvei o token após o login
  Quando selecionar as opções da minha corrida para o tipo executive
  Então quero ter uma estimativa do valor final

Cenário: Comparar diferença lite versos executive
  Dado que salvei o token após o login
  Quando quiser saber a diferença do valor da corrida num carro do tipo executive com o valor do tipo lite
  Então devo ver que o valor do executive é dez porcento maior que o lite para a mesma origem/destino

Cenário: Realizar estimativa sem informar token
  Dado que salvei o token após o login
  Quando solicitar uma estimativa sem ter informado o token
  Então devo ver uma mensagem informando que o token é obrigatório

Cenário: Solicitar corrida lite
  Dado que estimei minha corrida do tipo lite
  Quando solicitar a corrida
  Então devo ver a origem/destino configurados
  E devo ver o valor da corrida tal como a estimativa

Cenário: Solicitar corrida executive
  Dado que estimei minha corrida do tipo executive
  Quando solicitar a corrida
  Então devo ver a origem/destino configurados
  E o valor da corrida tal como a estimativa

Cenário: Validar token
  Dado que inseri o token errado
  Quando acionar a opção de estimativa
  Então devo ver uma mensagem informando que o token é inválido
