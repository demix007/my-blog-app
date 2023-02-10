require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ayodeji', photo: 'Abidemi DP', bio: 'A Full-stack Web Developer', post_counter: 5) }

  before { subject.save }

  it 'Subject is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The post_counter is only valid whent it is an integer' do
    subject.post_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'abc' * 30
    expect(subject).to_not be_valid
  end

  it 'bio should not be empty' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'photo should have valid value' do
    expect(subject.photo).to eql 'Abidemi DP'
  end

  it 'The post_counter is expected to be greater than or equal to zero' do
    subject.post_counter = -10
    expect(subject).to_not be_valid
  end

  it ' Should test post_counter to be >= 0' do
    expect(subject.post_counter).to be >= 0
  end
end
