require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  # pending "add some scenarios (or delete) #{__FILE__}"

  it 'UNIT TEST for valid book title' do
    book = Book.new(title: "Book Title 1")
    expect(book.title).to eq('Book Title 1')
  end
  it 'INTEGRATION TEST for valid book title' do
    visit '/books/new'
    fill_in "book_title", with: 'Diary of a Wimpy Kid'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.title).to eq('Diary of a Wimpy Kid')
  end

  it 'UNIT TEST for empty book title' do
    book = Book.new(title: "")
    expect(book.title).to eq('')
  end
  it 'INTEGRATION TEST for empty book title' do
    visit '/books/new'
    fill_in "book_title", with: ''
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.title).to eq('')
  end

  #-------------------------------------------------------------------------------

  it 'UNIT TEST for valid book author' do
    book = Book.new(author: "Book Author 1")
    expect(book.author).to eq('Book Author 1')
  end
  it 'INTEGRATION TEST for valid book author' do
    visit '/books/new'
    fill_in "book_author", with: 'Jeff Kinney'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.author).to eq('Jeff Kinney')
  end

  #-------------------------------------------------------------------------------

  it 'UNIT TEST for valid book price' do
    book = Book.new(price: 5.99)
    expect(book.price.to_f.round(2)).to eq(5.99)
  end
  it 'INTEGRATION TEST for valid book price' do
    visit '/books/new'
    fill_in "book_price", with: 5.99
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.price.to_f.round(2)).to eq(5.99)
  end

  #-------------------------------------------------------------------------------

  it 'UNIT TEST for valid book publish date' do
    book = Book.new(published_date: Date.new(2024, 1, 28))
    expect(book.published_date).to eq(Date.new(2024, 1, 28))
  end
  it 'INTEGRATION TEST for valid book author' do
    visit '/books/new'
    fill_in "book_published_date", with: "2024-01-28"
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.published_date).to eq(Date.new(2024, 1, 28))
  end


  # it 'adds a EMPTY book and tests it' do
  #   visit '/books/new'
  #   fill_in "book_title", with: ' '
  #   click_on 'Create Book'
  #   expect(page).to have_content('Book was successfully created')
  #   book = Book.order("id").last
  #   expect(book.title).to eq(' ')
  # end

  # it 'INTEGRATION TEST adds a valid input and then tests it' do
  #   visit '/books/new'
  #   fill_in "book_title", with: 'Diary of a Wimpy Kid'
  #   fill_in "book_author", with: "Jeff Kinney"
  #   fill_in "book_price", with: "5.99"
  #   fill_in "book_published_date", with: "2024-01-28"
  #   click_on 'Create Book'
  #   expect(page).to have_content('Book was successfully created.')

  #   book = Book.order("id").last
  #   expect(book.title).to eq('Diary of a Wimpy Kid')
  #   expect(book.author).to eq('Jeff Kinney')
  #   expect(book.price.to_f.round(2)).to eq(5.99)
  #   expect(book.published_date).to eq(Date.new(2024, 1, 28))
  # end

end
