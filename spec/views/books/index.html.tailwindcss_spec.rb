require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        title: "Title",
        description: "MyText",
        user: nil,
        pdf: "Pdf",
        image: "Image"
      ),
      Book.create!(
        title: "Title",
        description: "MyText",
        user: nil,
        pdf: "Pdf",
        image: "Image"
      )
    ])
  end

  it "renders a list of books" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Pdf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image".to_s), count: 2
  end
end
