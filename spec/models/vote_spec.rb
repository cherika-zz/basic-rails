require 'rails_helper'

# RSpec.describe Vote, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Vote do

  include TestFactories

	describe "validations" do
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				v = Vote.new(value: 1)
				expect(v.valid?).to eq(true)

				v2 = Vote.new(value: -1)
				expect(v2.valid?).to eq(true)

				v3 = Vote.new(value: 2)
				expect(v3.valid?).to eq(false)
			end
		end
	end

describe 'after_save' do
  it "calls `Post#update_rank` after save" do
    post = associated_post
    vote = Vote.new(value: 1, post: post)
    expect(post).to receive(:update_rank)
    vote.save
  end
end

# def associated_post(options={})
#   post_options = {
#     title: 'Post Title',
#     body: 'Post bodies must be pretty long.',
#     topic: Topic.create(name: 'Topic name'),
#     user: authenticated_user
#   }.merge(options)
#   Post.create(post_options)
# end

# def authenticated_user(options={})
#   user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
#   user = User.new(user_options)
#   user.skip_confirmation!
#   user.save
#   user
# end
end
