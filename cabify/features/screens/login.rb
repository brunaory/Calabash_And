class Login < Calabash::ABase

  def validar_texto(*args)
    args.each do |text|
      wait_for_elements_exist(["* text:'#{text}'"], timeout: 30)
    end
  end

  def validar_elemento(*args)
    args.each do |elements|
      wait_for_elements_exist(["* id:'#{elements}'"], timeout: 30)
    end
  end

  def token
    page(Login).validar_texto('Remember this code for requesting a Taxi')
    page(Login).validar_elemento('?')
  end

  def edit_username(user)
    page(Login).validar_texto('QAbify')
    touch("* id:'user_name_edit_text'")
    keyboard_enter_text(("#{user}"))
  end

  def edit_password(password)
    page(Login).validar_texto('QAbify')
    touch("* id:'password_edit_text'")
    keyboard_enter_text(("#{doc}"))
  end

  def btn_login
    page(Login).validar_texto('LOGIN')
    touch("* id:'login_button'")
  end
end
