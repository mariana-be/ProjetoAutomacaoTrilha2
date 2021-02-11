#criarCadastro
Dado('que acesso a pagina principal da Loja Virtual') do
    visit("https://magento.nublue.co.uk/")
end

Quando('realizar a criacao de uma nova conta') do
    click_link 'Create an Account'
end
  
Quando('preencher as informacoes de {string}, {string}, {string}, {string} e {string}') do |string, string2, string3, string4, string5|
    @name = Faker::Name.first_name  
    @lastname = Faker::Name.last_name
    @email = Faker::Internet.email 
    @password = Faker::Internet.password

    find("#firstname").set @name
    find("#lastname").set @lastname
    find("#email_address").set @email
    find("#password").set @password
    find("#password-confirmation").set @password
end
  
Então('clicar em criar conta') do
    find("button[title='Create an Account']").click
end
  
Então('deve ser visualizado a mensagem que o cadastro foi realizado com sucesso.') do
    expect(page).to have_text "Thank you for registering with Main Website Store."
    sleep 5
end

