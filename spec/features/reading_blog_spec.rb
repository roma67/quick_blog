require 'rails_helper'

feature 'Reading the Blog' do
  background do
    @user = User.create(email: 'user@mail.ru', password: '123456789', password_confirmation: '123456789')
    @post = @user.posts.create(title: 'Awesome Blog Post', body: 'Lorem ipsum dolor sit amet')
    #@post.save
    Post.create(title: 'Another Awesome Post', body: 'Lorem ipsum dolor sit amet')
  end

  scenario 'Reading the blog index' do
    visit root_path

    expect(page).to have_content 'Awesome Blog Post'
    #expect(page).to have_content 'Another Awesome Post'
  end

  scenario 'Reading an individual blog' do
    visit root_path
    click_link 'Awesome Blog Post'

    expect(current_path).to eq post_path(@post)
  end
end