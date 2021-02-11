# language: pt
Funcionalidade: Compra em Loja Virtual Luma
    Como um cliente que visualiza os produtos na loja Virtual
    Deve conseguir fazer cadastro, escolher o produto, adicionar no carrinho e finalizar a compra 

Contexto: Pagina Principal
  Dado que acesso a pagina principal da Loja Virtual

  @criarCadastro
  Cenario: Criar Cadastro de Usuario
  Quando realizar a criacao de uma nova conta
  E preencher as informacoes de 'firstName', 'lastName', 'email', 'password' e 'confirmPassword'
  E clicar em criar conta
  Entao deve ser visualizado a mensagem que o cadastro foi realizado com sucesso.
