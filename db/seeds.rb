User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

puts "Usuário admin criado: admin@example.com / password123"