json.extract! question, :id, :question_number, :created_at, :updated_at
json.url question_url(question, format: :json)
