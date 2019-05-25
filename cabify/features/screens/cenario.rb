class Corrida < Calabash::ABase

  def save_token
    page(Login).validar_texto('Remember this code for requesting a Taxi')
    @metodo = query("* id:'captcha_text', :text").first
    @token = @metodo['text']
    puts @token
  end

  def btn_next
    page(Login).validar_texto('Remember this code for requesting a Taxi')
    page(Login).validar_texto('NEXT')
    touch("* id:'captcha_button'")
  end

  def sel_pick_up_point(indice)
    page(Login).validar_texto('Choose your journey settings')
    page(Login).validar_texto('Select your origin and destinatin:')
    touch("* id:'pick_up_point'")
    touch("* id:'text1', index:#{indice}")
    @el_origem = query("* id:'price_text', :text").first
    @origem = @elementos['text']
  end

  def sel_drop_off_point(indice)
    page(Login).validar_texto('Choose your journey settings')
    page(Login).validar_texto('Select your origin and destinatin:')
    touch("* id:'drop_off_point'")
    touch("* id:'text1', index:#{indice}")
    @el_destino = query("* id:'price_text', :text").first
    @destino = @elementos['text']
  end

  def sel_type_car(type)
    page(Login).validar_texto('Choose your type of car:')
    touch("* id:'#{type}'")
  end

  def edit_token(token)
    page(Login).validar_texto('Type the captcha of the previous screen:')
    touch("* id:'captcha_text'")
    keyboard_enter_text(token)
    hide_soft_keyboard
  end

  def btn_estimate
    page(Login).validar_texto('ESTIMATE')
    touch("* id:'estimate_button'")
  end

  def value_estimate
    page(Login).validar_texto('Estimated price:')
    @elementos = query("* id:'price_text', :text").first
    @valor = @elementos['text']
    puts @valor
  end

  def diferenca_executive_lite
    f_lite = @valor_lite.to_f
    @executive = @f_lite * 1.1
    f_exe = @valor_exe.to.i
    @final = @exe == @f_exe
  end

  def btn_request_car
    page(Login).validar_text('REQUEST CAR')
    touch("* id:'request_button'")
  end

  def contem_texto(texto)
    wait_for_elements_exist(["* {text CONTAINS '#{texto}'}"], timeout: 30)
  end

  def config_orig_dest
    page(Corrida).contem_texto(@origem)
    page(Corrida).contem_texto(@destino)
    @el_destino = query("* id:'price_text', :text").first
    @destino = @elementos['text']
  end

end
