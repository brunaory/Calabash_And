Dado(/^que eu informe dados válidos$/) do
  page(Login).edit_username('user@qabify.com')
  page(Login).edit_password('1234Abc')
end

Quando(/^acionar o login$/) do
  page(Login).btn_login
end

Então(/^devo receber um token$/) do
  page(Login).token
end

Dado(/^que eu informe dados inválidos$/) do
  page(Login).edit_username('user@qabify')
  page(Login).edit_password('1234Ab')
end

Então(/^devo ver uma mensagem informando que meus dados estão incorretos$/) do
  page(Login).validar_texto('Bad Login')
  page(Login).validar_texto('User nome or Password is not corret')
end
