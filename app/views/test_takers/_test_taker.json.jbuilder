json.extract! test_taker, :id, :login, :password, :title, :lastname, :firstname, :gender, :email, :picture, :address, :created_at, :updated_at
json.url test_taker_url(test_taker, format: :json)
