json.extract! book, :id, :b_title, :b_author, :b_lang, :b_pub, :b_edition, :b_image, :b_subject, :b_summary, :b_spl, :Library_id, :created_at, :updated_at
json.url book_url(book, format: :json)
