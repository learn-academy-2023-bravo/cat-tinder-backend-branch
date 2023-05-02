require 'rails_helper'


RSpec.describe Tree, type: :model do
  before :each do
    @tree = Tree.create()
  end

  it 'should validate name' do
    expect(@tree.errors[:name]).to_not be_empty
  end

  it 'should validate age' do
    expect(@tree.errors[:age]).to_not be_empty
  end

  it 'should validate enjoys' do
    expect(@tree.errors[:enjoys]).to_not be_empty
  end

  it 'should validate image' do
    expect(@tree.errors[:image]).to_not be_empty
  end

  it 'should validate enjoys is greater or equal to 10' do
    @tree = Tree.create(enjoys: 'adsf')
    expect(@tree.errors[:enjoys]).to_not be_empty
  end
end
