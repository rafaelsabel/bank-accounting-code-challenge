# frozen_string_literal: true

# clients
pedro = Client.create!(name: 'Pedro', email: 'pedro@email.com', password: 'Senha123.', confirmed_at: DateTime.now)
paulo = Client.create!(name: 'Paulo', email: 'paulo@email.com', password: 'Senha123.', confirmed_at: DateTime.now)

# accounts
Account.create!(client_id: pedro.id, balance: 1000.50)
Account.create!(client_id: paulo.id, balance: 500)
