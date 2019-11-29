**Code Challenge - Bank Accounting**

Contexto

Você deve criar um sistema que gerencia contas bancárias de clientes, permitindo fazer transferências de um cliente para outro e expor o saldo atual da conta, sempre em reais.

**Funcionalidade #1 - Transferir dinheiro**

Entrada: `<source_account_id>, <destination_account_id>, <amount>`

Fluxo principal:
1. O cliente faz uma requisição com os dados descritos acima
2. O sistema valida todos os dados
3. O sistema computa um débito na conta de origem
4. O sistema computa um crédito na conta de destino

Fluxo excepcional: a conta de origem não possui saldo suficiente
1. O sistema cancela a transferência

**Funcionalidade #2 - Consultar saldo**

Entrada: `<account_id>`

Fluxo principal:
1. O cliente faz uma requisição com os dados descritos acima
2. O sistema calcula o saldo atual da conta baseado no histórico de transferências da conta

Fluxo excepcional: Conta inexistente
1. O sistema responde que a conta informada não existe

**Requisitos obrigatórios**

- O sistema deve expor uma API via HTTP, aceitando e respondendo `JSON`
- A API deve possuir algum mecanismo de autenticação para identificar o cliente que está fazendo as requisições
- Os dados devem ser armazenados em um banco PostgreSQL
- Você deve usar Ruby ou Elixir para implementar este projeto
- O código deve ser versionado usando git
- O repositório deve conter um README documentando como o sistema pode ser usado e como outra pessoa pode contribuir com o código, similar a um projeto Open Source

**Execução e Testes**

Instalar as gems:

```
bundle install
```

Crias as bases de dados - development e test:

```
rails db:create
```

Executar migrações:

```
rails db:migrate
```

Executar a seed:

```
rails db:seed
```

Executar a aplicação:

```
rails s
```

Executar testes:

```
rspec
```

Rotas disponíveis:

```
rails routes
```

**Contribuir com o código**

Para contribuir com o código, siga os passos a seguir:

- Faça o fork do projeto;
- Clone seu fork usando a URL do projeto (git or https);
- Crie uma nova branch para implementar sua funcionalidade;
- Faça suas alterações e adicione um novo commit;
- Verifique se seus testes estão passando;
- Submeta seu código para o repositório remoto;
- Submeta seu código para o repositório remoto;
- Vá para a página do fork no seu Github;
- Abra um novo Pull request;
