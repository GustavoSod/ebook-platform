require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'create a new book' do
    book = create(:book)
    expect(book).to be_valid
  end
end
