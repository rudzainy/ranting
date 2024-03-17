# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.count == 0
  gugel_about_page = User.create!(
    username: "about",
    full_name: "gugel.my = Network!",
    email: "hello@gugel.my",
    password: "123456",
    password_confirmation: "123456",
    description: "gugel.my is a link-in-bio platform that allows any Malaysian creators to showcase their work and social media profiles in a single, easy-to-share link ♥️"
  )

  default_group = Group.create(name: "🌊 Surf the web through these links 🏄‍♂️")
  default_group.links.create!(
    category: 'free',
    icon: 'building',
    icon_style: 'solid',
    position: '1',
    title: 'Visit our office',
    url: 'https://gugel.my/gugeloffice',
    user: gugel_about_page,
    css_class: 2
  )
  default_group.links.create!(
    category: 'free',
    icon: 'hand-spock',
    icon_style: 'solid',
    position: '2',
    title: 'Say hi to Faris',
    url: 'gugel.my/faris',
    user: gugel_about_page,
    css_class: 1
  )
  default_group.links.create!(
    category: 'free',
    icon: 'comments',
    icon_style: 'solid',
    position: '3',
    title: 'Say hi to Jeanette',
    url: 'gugel.my/jeanette',
    user: gugel_about_page,
    css_class: 1
  )
  default_group.links.create!(
    category: 'free',
    icon: 'newspaper',
    icon_style: 'solid',
    position: '4',
    title: 'Read our blog',
    url: 'gugel.my/blog',
    user: gugel_about_page,
    css_class: 2
  )
  default_group.links.create!(
    category: 'free',
    icon: 'moon',
    icon_style: 'solid',
    position: '5',
    title: 'Say hi to Rudzainy',
    url: 'gugel.my/rudzainy',
    user: gugel_about_page,
    css_class: 1
  )
end