# Criar usuário admin inicial
User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Criar bairros
bairros = [
  'Centro',
  'Copacabana', 
  'Ipanema',
  'Barra da Tijuca',
  'Botafogo',
  'Flamengo'
]

bairros.each do |nome|
  Neighborhood.find_or_create_by(name: nome)
end

# Criar propriedades de exemplo
propriedades = [
  {
    title: 'Apartamento 2 quartos em Copacabana',
    price: 850000,
    description: 'Lindo apartamento com vista para o mar, 2 quartos, sala ampla, cozinha americana e varanda. Próximo ao metrô e comércio local.',
    neighborhood: 'Copacabana'
  },
  {
    title: 'Casa 3 quartos com quintal no Centro',
    price: 650000,
    description: 'Casa térrea com 3 quartos, sala, cozinha, banheiro e quintal. Ideal para famílias. Localização privilegiada no centro da cidade.',
    neighborhood: 'Centro'
  },
  {
    title: 'Cobertura duplex em Ipanema',
    price: 1500000,
    description: 'Cobertura duplex de luxo com 4 suítes, piscina privativa, churrasqueira e vista panorâmica. Acabamento de primeira qualidade.',
    neighborhood: 'Ipanema'
  },
  {
    title: 'Apartamento moderno na Barra',
    price: 750000,
    description: 'Apartamento novo com 3 quartos, sendo 1 suíte, cozinha gourmet, área de serviço e 2 vagas de garagem. Condomínio com academia e piscina.',
    neighborhood: 'Barra da Tijuca'
  }
]

propriedades.each do |prop|
  neighborhood = Neighborhood.find_by(name: prop[:neighborhood])
  Property.find_or_create_by(title: prop[:title]) do |property|
    property.price = prop[:price]
    property.description = prop[:description] 
    property.neighborhood = neighborhood
  end
end

puts "Seeds executados com sucesso!"
puts "Usuário admin: admin@example.com / password123"
puts "Bairros criados: #{Neighborhood.count}"
puts "Propriedades criadas: #{Property.count}"