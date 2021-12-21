class Article < ApplicationRecord
    validates :headline, presence: true
end
