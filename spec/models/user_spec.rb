require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ayodeji', photo: 'Abidemi DP', bio: 'A Full-stack Web Developer', posts_counter: 10) }

  before { subject.save }

  it 'should expect name to be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should expect the value of the post_counter to be an integer' do
    subject.posts_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'should expect the value of the post_counter to be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it ' Should test posts_counter to be >= 0' do
    expect(subject.posts_counter).to be >= 0
  end
end
