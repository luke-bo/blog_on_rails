class Post < ApplicationRecord
    # https://guides.rubyonrails.org/active_record_validations.html
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: { minimum: 50 }
end
