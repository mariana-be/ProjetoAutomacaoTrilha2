#signIn
Quando('prencher os dados de login com {string} e {string}') do |email, senha|
    click_link('Sign')
    find("#email").set 'roni_cost@example.com'
    find("#pass").set 'roni_cost3@example.com'
  end
  
Entao('deve {string} para entrar na conta existente') do |login|
    find("#send2").click
    sleep 5
  end

#buscarProduto
Quando('buscar e adicionar um produto no carrinho') do
  find("#search").set("Layla Tee \n")
  find("img[alt='Layla Tee']").click
  find("#option-label-size-142-item-170").click
  find("#option-label-color-93-item-58").click
  find("#qty").set '3'
  find("#product-addtocart-button").click
  click_link('shopping cart')
end

Entao('deve finalizar o pedido indo para o Checkout') do
  find("button[title='Proceed to Checkout']").click
  sleep 5
end

#finalizarCompra
Dado('que acesso a pagina principal da Loja Virtual com o login efetuado') do
  steps %{
    Quando prencher os dados de login com 'email' e 'senha'
    Então deve 'logar' para entrar na conta existente
  }
end

Quando('for realizado o checkout da compra') do
  steps %{
  Quando buscar e adicionar um produto no carrinho
  Então deve finalizar o pedido indo para o Checkout
  }
end

Entao('deve preencher os dados para finalizar a compra') do
  @street = Faker::Address.street_name
  @city = Faker::Address.city
  @postcode = Faker::Address.postcode
  @phonenumber = Faker::PhoneNumber.phone_number
  
    find(:xpath, '//input[@name="street[0]"]').set(@street)
    find(:xpath, '//input[@name="city"]').set(@city)
    find(:xpath, '//option[@value="BR"]').click
    find(:xpath, '//option[@value="508"]').click
    find(:xpath, '//input[@name="postcode"]').set(@postcode)
    find(:xpath, '//input[@name="telephone"]').set(@phonenumber)
    first(:xpath,'//input[@class="radio"]').click
    find(:xpath, '//button[@class="button action continue primary"]').click
    sleep 5
  end

Entao('mostrar que a compra foi efetuada com sucesso') do
  find(:xpath, '//button[@title="Place Order"]').click
  expect(page).to have_text "Thank you for your purchase!"
  sleep 5
end


