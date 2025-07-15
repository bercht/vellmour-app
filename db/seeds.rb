# db/seeds.rb - Atualizado com novos campos de busca

# Limpar dados existentes em desenvolvimento
if Rails.env.development?
  Property.destroy_all
  Neighborhood.destroy_all
  User.destroy_all
end

# Criar usuário admin
admin = User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

puts "✅ Admin criado: #{admin.email}"

# Criar bairros
neighborhoods_data = [
  'Centro',
  'Copacabana', 
  'Ipanema',
  'Leblon',
  'Barra da Tijuca',
  'Botafogo',
  'Flamengo',
  'Tijuca'
]

neighborhoods = neighborhoods_data.map do |name|
  neighborhood = Neighborhood.find_or_create_by(name: name)
  puts "✅ Bairro criado: #{neighborhood.name}"
  neighborhood
end

# Criar propriedades com dados mais realistas
properties_data = [
  {
    title: 'Apartamento de Luxo em Copacabana',
    price: 1_200_000,
    description: 'Apartamento totalmente reformado com vista para o mar. Localizado a poucos metros da praia de Copacabana, com fácil acesso ao transporte público.',
    neighborhood: neighborhoods.find { |n| n.name == 'Copacabana' },
    bedrooms: 3,
    bathrooms: 2, 
    area_m2: 120.5,
    garage_spaces: 1,
    property_type: 'Apartamento',
    furnished: true,
    featured: true
  },
  {
    title: 'Casa Moderna no Leblon',
    price: 2_500_000,
    description: 'Casa de alto padrão com arquitetura moderna, jardim privativo e área gourmet completa. Próximo aos melhores restaurantes e shopping.',
    neighborhood: neighborhoods.find { |n| n.name == 'Leblon' },
    bedrooms: 4,
    bathrooms: 3,
    area_m2: 200.0,
    garage_spaces: 2,
    property_type: 'Casa',
    furnished: false,
    featured: true
  },
  {
    title: 'Studio em Ipanema',
    price: 450_000,
    description: 'Studio compacto e funcional, ideal para solteiros ou casal. Localização privilegiada próximo à praia e ao metrô.',
    neighborhood: neighborhoods.find { |n| n.name == 'Ipanema' },
    bedrooms: 1,
    bathrooms: 1,
    area_m2: 45.0,
    garage_spaces: 0,
    property_type: 'Studio',
    furnished: true,
    featured: true
  },
  {
    title: 'Cobertura na Barra da Tijuca',
    price: 1_800_000,
    description: 'Cobertura com piscina privativa, churrasqueira e vista panorâmica. Condomínio completo com área de lazer.',
    neighborhood: neighborhoods.find { |n| n.name == 'Barra da Tijuca' },
    bedrooms: 4,
    bathrooms: 4,
    area_m2: 180.0,
    garage_spaces: 3,
    property_type: 'Cobertura',
    furnished: false,
    featured: false
  },
  {
    title: 'Apartamento Familiar em Botafogo',
    price: 750_000,
    description: 'Apartamento espaçoso com boa iluminação natural. Prédio com portaria 24h e próximo a escolas e comércio.',
    neighborhood: neighborhoods.find { |n| n.name == 'Botafogo' },
    bedrooms: 3,
    bathrooms: 2,
    area_m2: 95.0,
    garage_spaces: 1,
    property_type: 'Apartamento',
    furnished: false,
    featured: false
  },
  {
    title: 'Loft Industrial no Centro',
    price: 380_000,
    description: 'Loft estilo industrial com pé-direito alto e decoração moderna. Ótimo para profissionais liberais.',
    neighborhood: neighborhoods.find { |n| n.name == 'Centro' },
    bedrooms: 1,
    bathrooms: 1,
    area_m2: 60.0,
    garage_spaces: 0,
    property_type: 'Loft',
    furnished: true,
    featured: false
  },
  {
    title: 'Casa de Vila em Flamengo',
    price: 920_000,
    description: 'Charmosa casa de vila com quintal e terraço. Recém-reformada mantendo características originais.',
    neighborhood: neighborhoods.find { |n| n.name == 'Flamengo' },
    bedrooms: 2,
    bathrooms: 2,
    area_m2: 110.0,
    garage_spaces: 1,
    property_type: 'Casa',
    furnished: false,
    featured: false
  },
  {
    title: 'Apartamento Econômico na Tijuca',
    price: 320_000,
    description: 'Apartamento em bom estado de conservação, ideal para primeiro imóvel. Próximo ao metrô e universidades.',
    neighborhood: neighborhoods.find { |n| n.name == 'Tijuca' },
    bedrooms: 2,
    bathrooms: 1,
    area_m2: 70.0,
    garage_spaces: 0,
    property_type: 'Apartamento',
    furnished: false,
    featured: false
  }
]

properties_data.each do |property_attrs|
  property = Property.find_or_create_by(
    title: property_attrs[:title]
  ) do |p|
    property_attrs.each { |key, value| p.send("#{key}=", value) }
  end
  
  puts "✅ Propriedade criada: #{property.title} - #{property.property_type} - #{property.bedrooms} quartos"
end

puts "\n🏠 Resumo dos dados criados:"
puts "👤 Usuários: #{User.count}"
puts "📍 Bairros: #{Neighborhood.count}" 
puts "🏢 Propriedades: #{Property.count}"
puts "⭐ Destaques: #{Property.featured.count}"
puts "💰 Preço médio: #{ActionController::Base.helpers.number_to_currency(Property.average(:price), unit: 'R$ ')}"

puts "\n🔑 Login do admin:"
puts "Email: admin@example.com"
puts "Senha: password123"