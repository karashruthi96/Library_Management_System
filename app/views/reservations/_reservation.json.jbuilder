json.extract! reservation, :id, :User_id, :Books_id, :t_borrow, :d_return, :status, :bookmark, :fine_total, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
