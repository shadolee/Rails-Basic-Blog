class Article < ApplicationRecord

  has_many :comments,
  dependent: :destroy
# this will remove any comments associated with an -->
# article if the article is deleted -->
  validates :title, presence: true,
                    length: { minimum: 5 }
# ensures all articles have a title at least 5 characters long
# presence: true is a helper that makes sure the attribute is not empty
# so the user cannot enter an empty title string
# could delete presence & length if wanted to
# invalid article reutrns "false"
end
