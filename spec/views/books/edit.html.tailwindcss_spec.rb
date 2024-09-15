require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let(:book) {
    Book.create!(
      title: "MyString",
      description: "MyText",
      user: nil,
      pdf: "MyString",
      image: "MyString"
    )
  }

  before(:each) do
    assign(:book, book)
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[user_id]"

      assert_select "input[name=?]", "book[pdf]"

      assert_select "input[name=?]", "book[image]"
    end
  end
end
