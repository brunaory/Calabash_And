#encoding: utf-8
#language: pt

Funcionalidade: Login
  Como usuário do QAbify
  Quero ter o máximo de informações sobre a corrida
  Para fazer a melhor escolha

@login
Cenário: Realizar login
  Dado que eu informe dados válidos
  Quando acionar o login
  Então devo receber um token

Cenário: Login negado
  Dado que eu informe dados inválidos
  Quando acionar o login
  Então devo ver uma mensagem informando que meus dados estão incorretos
