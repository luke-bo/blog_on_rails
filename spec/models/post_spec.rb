require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe "#validates" do
    it('requires a title') do
      # GIVEN
      new_post = Post.new
      
      # WHEN
      new_post.valid?
      # .valid? is a rails ActiveRecord helper method
      
      # THEN
      # puts new_post.errors.messages
      expect(new_post.errors.messages).to(have_key(:title))
    end

    it 'requires a unique title' do
      # GIVEN
      # One job post in the db and an instance of job post
      # with the same title
      persisted_post = Post.create(
        title: "First Post",
        body: "Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post. Hello World, and welcome to my first blog post."
      )
      non_unique_post = Post.new title: persisted_post.title
      
      # WHEN
      # validations triggered
      non_unique_post.valid?
      
      # THEN
      # We get an error on title
      expect(non_unique_post.errors.messages).to(have_key(:title))
      expect(non_unique_post.errors.messages[:title]).to(include("has already been taken"))
    end

    it 'requires a body' do
      # GIVEN
      new_post = Post.new(title: 'Test for Body Presence')
      # WHEN
      new_post.valid?
      # THEN
      expect(new_post.errors.messages).to(have_key(:body))
    end

    it 'body length must be over 50 chars' do
      # GIVEN
      new_post = Post.new(title: 'Test for Body Length', body: 'This body has less than the req chars')
      # WHEN
      new_post.valid?
      # THEN
      puts new_post.errors.messages
      expect(new_post.errors.messages[:body]).to(include("is too short (minimum is 50 characters)"))
      # NOTE: This test was failing until I added the full error message into the include block
    end
  end
end
