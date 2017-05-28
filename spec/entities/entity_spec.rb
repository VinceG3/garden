require 'rails_helper'

RSpec.describe 'Entities' do
  it 'sees the entities' do
    expect{Entities::Context}.to_not raise_error
  end
end