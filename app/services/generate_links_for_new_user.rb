class GenerateLinksForNewUser
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    if @user.links.count == 0
      # Create default links group
      default_group = Group.create(name: "My Links", user_id: @user.id)
      # Creates 5 free links
      Link.create(
        user_id: @user.id, 
        title: 'Change this', 
        url: '', 
        category: 'free',
        group_id: default_group.id
      ) while @user.links.count < 5
      
      # Create social links group
      social_group = Group.create(name: "My Social Media", user_id: @user.id)
      # Creates 5 social links
      Link.create(
        group_id: social_group.id,
        category: 'social',
        icon: 'twitter',
        icon_style: 'brands',
        position: '6',
        title: 'Twitter',
        url: 'twitter.com/your_username',
        user_id: @user.id
      )
      Link.create(
        group_id: social_group.id,
        category: 'social',
        icon: 'whatsapp',
        icon_style: 'brands',
        position: '7',
        title: 'Whatsapp',
        url: 'wa.me/60123456789',
        user_id: @user.id
      )
      Link.create(
        group_id: social_group.id,
        category: 'social',
        icon: 'facebook',
        icon_style: 'brands',
        position: '8',
        title: 'Facebook',
        url: 'facebook.com/your_username',
        user_id: @user.id
      )
      Link.create(
        group_id: social_group.id,
        category: 'social',
        icon: 'instagram',
        icon_style: 'brands',
        position: '9',
        title: 'Instagram',
        url: 'instagram.com/your_username',
        user_id: @user.id
      )
      Link.create(
        group_id: social_group.id,
        category: 'social',
        icon: 'linkedin',
        icon_style: 'brands',
        position: '10',
        title: 'LinkedIn',
        url: 'linkedin.com/in/your_username',
        user_id: @user.id
      )
    end
  end
end