Fabricator(:post) do
  published_on DateTime.now
end

Fabricator(:user) do
  email { Faker::Internet.email }
  password "password"
  password_confirmation "password"
  posts(rand: 4) { |attrs, i| Fabricate(:post, title: "Post #{i}", body: Faker::Lorem.paragraph(4))}
end
