Dado(/^que salvei o token após o login$/) do
  page(Corrida).save_token
  page(Corrida).btn_next
end

Quando(/^selecionar as opções da minha corrida para o tipo lite$/) do
  page(Corrida).sel_pick_up_point(4)
  page(Corrida).sel_drop_off_point(2)
  page(Corrida).sel_type_car('liteCheckBox')
  page(Corrida).edit_token(@token)
  page(Corrida).btn_estimate
end

Então(/^quero ter uma estimativa do valor final$/) do
  page(Corrida).value_estimate
end

Quando(/^selecionar as opções da minha corrida para o tipo executive$/) do
  page(Corrida).sel_pick_up_point(1)
  page(Corrida).sel_drop_off_point(3)
  sel_type_car(executiveCheckBox)
  page(Corrida).edit_token
  page(Corrida).btn_estimate
end

Quando(/^quiser saber a diferença do valor da corrida num carro do tipo executive com o valor do tipo lite$/) do
  page(Corrida).sel_pick_up_point(2)
  page(Corrida).sel_drop_off_point(4)
  page(Corrida).sel_type_car('liteCheckBox')
  page(Corrida).edit_token
  page(Corrida).btn_estimate
  page(Corrida).value_estimate
  @valor_lite = @valor
  page(Corrida).sel_pick_up_point(2)
  page(Corrida).sel_drop_off_point(4)
  sel_type_car(executiveCheckBox)
  page(Corrida).btn_estimate
  page(Corrida).value_estimate
  @valor_exe = @valor
end

Então(/^devo ver que o valor do executive é dez porcento maior que o lite para a mesma origem\/destino$/) do
  page(Corrida).diferenca_executive_lite
end

Quando(/^solicitar uma estimativa sem ter informado o token$/) do
  page(Corrida).sel_pick_up_point(2)
  page(Corrida).sel_drop_off_point(4)
  page(Corrida).sel_type_car('liteCheckBox')
  page(Corrida).btn_estimate
end

Então(/^devo ver uma mensagem informando que o token é obrigatório$/) do
  page(Login).validar_textoo('Error in captcha!')
  age(Login).validar_textoo('Captcha typed is wrong')
end

Dado(/^que estimei minha corrida do tipo lite$/) do
  page(Corrida).save_token
  page(Corrida).btn_next
  page(Corrida).sel_pick_up_point(4)
  page(Corrida).sel_drop_off_point(2)
  page(Corrida).sel_type_car('liteCheckBox')
  page(Corrida).edit_token
  page(Corrida).btn_estimate
end

Quando(/^solicitar a corrida$/) do
  page(Corrida).btn_request_car
end

Então(/^devo ver a origem\/destino configurados$/) do
  page(Corrida).config_orig_dest
end

Então(/^devo ver o valor da corrida tal como a estimativa$/) do
  page(Corrida).validar_texto(@valor)
end

Dado(/^que estimei minha corrida do tipo executive$/) do
  page(Corrida).save_token
  page(Corrida).btn_next
  page(Corrida).sel_pick_up_point(4)
  page(Corrida).sel_drop_off_point(2)
  page(Corrida).sel_type_car('liteCheckBox')
  page(Corrida).edit_token
  page(Corrida).btn_estimate
end

Dado(/^que inseri o token errado$/) do
    page(Corrida).btn_next
    page(Corrida).sel_pick_up_point(4)
    page(Corrida).sel_drop_off_point(2)
    page(Corrida).sel_type_car('liteCheckBox')
    page(Corrida).edit_token(123)
end

Quando(/^acionar a opção de estimativa$/) do
  page(Corrida).btn_estimate
end

Então(/^devo ver uma mensagem informando que o token é inválido$/) do
  page(Corrida).validar_texto('Erro in captcha!')
  page(Corrida).validar_texto('Captcha typed is wrong')
end
